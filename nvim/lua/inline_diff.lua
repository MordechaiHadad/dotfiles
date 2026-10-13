local M = {}
local inlineDiffNamespace = vim.api.nvim_create_namespace("inline_git_diff")

local function findBufferForPath(absolutePath)
	for _, bufferId in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(bufferId) and vim.fn.fnamemodify(vim.api.nvim_buf_get_name(bufferId), ":p") == absolutePath then
			return bufferId
		end
	end
end

local function findGitRoot(absolutePath)
	local directory = vim.fn.fnamemodify(absolutePath, ":h")
	if vim.fs and vim.fs.root then
		local root = vim.fs.root(directory, ".git")
		if root then return root end
	end
	local output = vim.fn.systemlist("git -C " .. vim.fn.shellescape(directory) .. " rev-parse --show-toplevel 2>/dev/null")
	return output[1] ~= "" and output[1] or nil
end

local function parseHunks(lines)
	local hunks, index = {}, 1
	while index <= #lines do
		local aStart, aCount, bStart, bCount = lines[index]:match("^@@ %-(%d+),?(%d*) %+(%d+),?(%d*) @@")
		if aStart then
			aStart, aCount, bStart, bCount = tonumber(aStart), aCount == "" and 1 or tonumber(aCount), tonumber(bStart), bCount == "" and 1 or tonumber(bCount)
			local hunkLines, nextIndex = {}, index + 1
			while nextIndex <= #lines and not lines[nextIndex]:match("^@@ ") and not lines[nextIndex]:match("^diff ") and not lines[nextIndex]:match("^index ") and not lines[nextIndex]:match("^%-%-%- ") and not lines[nextIndex]:match("^%+%+%+ ") do
				hunkLines[#hunkLines + 1] = lines[nextIndex]
				nextIndex = nextIndex + 1
			end
			hunks[#hunks + 1] = { added = { start = bStart, count = bCount }, removed = { start = aStart, count = aCount }, lines = hunkLines }
			index = nextIndex
		else index = index + 1 end
	end
	return hunks
end

local inlineDiffGroup = vim.api.nvim_create_augroup("InlineGitDiffWinbar", { clear = true })

local function normalize_hunks(hunks, line_count)
	local items = {}
	for _, hunk in ipairs(hunks) do
		local added = hunk.added or { start = 1, count = 0 }
		local removed = hunk.removed or { start = 0, count = 0 }
		local lnum
		if (added.count or 0) > 0 then
			lnum = added.start
		else
			lnum = math.min(math.max((added.start or 0) + 1, 1), math.max(line_count, 1))
		end
		items[#items + 1] = { lnum = lnum, added = added, removed = removed }
	end
	table.sort(items, function(a, b) return a.lnum < b.lnum end)
	return items
end

local function diff_totals(items)
	local add, del = 0, 0
	for _, h in ipairs(items) do
		add = add + (h.added.count or 0)
		del = del + (h.removed.count or 0)
	end
	return add, del
end

local function current_hunk_index(items, cursor_lnum)
	local idx = 1
	for i, h in ipairs(items) do
		if cursor_lnum >= h.lnum then idx = i end
	end
	return idx
end

local function update_diff_winbar(bufnr)
	if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then return end
	local items = vim.b[bufnr].inline_diff_hunks
	if not items or #items == 0 then return end
	local win = vim.fn.bufwinid(bufnr)
	if win == -1 then return end
	local cursor_lnum = vim.api.nvim_win_get_cursor(win)[1]
	local idx = current_hunk_index(items, cursor_lnum)
	local short = vim.fn.fnamemodify(vim.b[bufnr].inline_diff_file or "", ":t")
	if short == "" then short = "diff" end
	vim.wo[win].winbar = string.format(" %%#Title#%s%%*  Hunk %d/%d (+%d -%d)", short, idx, #items, vim.b[bufnr].inline_diff_added or 0, vim.b[bufnr].inline_diff_removed or 0)
end

function M.inline_diff_next()
	local bufnr = vim.api.nvim_get_current_buf()
	local items = vim.b[bufnr].inline_diff_hunks
	if not items or #items == 0 then
		vim.notify("No hunks", vim.log.levels.INFO)
		return
	end
	local cursor = vim.api.nvim_win_get_cursor(0)[1]
	local target = items[1].lnum
	for _, h in ipairs(items) do
		if h.lnum > cursor then
			target = h.lnum
			break
		end
	end
	if cursor >= items[#items].lnum then target = items[1].lnum end
	pcall(vim.api.nvim_win_set_cursor, 0, { target, 0 })
	vim.cmd("normal! zz")
	update_diff_winbar(bufnr)
end

function M.inline_diff_prev()
	local bufnr = vim.api.nvim_get_current_buf()
	local items = vim.b[bufnr].inline_diff_hunks
	if not items or #items == 0 then
		vim.notify("No hunks", vim.log.levels.INFO)
		return
	end
	local cursor = vim.api.nvim_win_get_cursor(0)[1]
	local target = items[#items].lnum
	for i = #items, 1, -1 do
		if items[i].lnum < cursor then
			target = items[i].lnum
			break
		end
	end
	if cursor <= items[1].lnum then target = items[#items].lnum end
	pcall(vim.api.nvim_win_set_cursor, 0, { target, 0 })
	vim.cmd("normal! zz")
	update_diff_winbar(bufnr)
end

function M.inline_git_diff(bufferNumber, targetPath)
	if type(bufferNumber) == "string" and not targetPath then targetPath, bufferNumber = bufferNumber, nil end
	local providedBuffer = bufferNumber and vim.api.nvim_buf_is_valid(bufferNumber) and bufferNumber or nil
	local filePath = targetPath and targetPath ~= "" and targetPath or providedBuffer and vim.api.nvim_buf_get_name(providedBuffer) or vim.api.nvim_buf_get_name(0)
	if not filePath or filePath == "" then vim.notify("inline_git_diff: no file", vim.log.levels.WARN) return end
	local absolutePath = vim.fn.fnamemodify(filePath, ":p")
	local sourceBuffer = providedBuffer or findBufferForPath(absolutePath)
	local fileLines, filetype, displayName = nil, nil, absolutePath
	if sourceBuffer and vim.api.nvim_buf_is_valid(sourceBuffer) and vim.api.nvim_buf_is_loaded(sourceBuffer) then
		local bufferName = vim.api.nvim_buf_get_name(sourceBuffer)
		if bufferName ~= "" and vim.fn.fnamemodify(bufferName, ":p") == absolutePath then fileLines, filetype, displayName = vim.api.nvim_buf_get_lines(sourceBuffer, 0, -1, false), vim.bo[sourceBuffer].filetype, bufferName end
	end
	if not fileLines then
		if vim.fn.filereadable(absolutePath) == 0 then vim.notify("inline_git_diff: not readable: " .. absolutePath, vim.log.levels.WARN) return end
		fileLines = vim.fn.readfile(absolutePath)
		filetype = vim.filetype and vim.filetype.match and vim.filetype.match({ filename = absolutePath }) or vim.bo[0].filetype or ""
	end
	local gitRoot = findGitRoot(absolutePath)
	if not gitRoot then vim.notify("inline_git_diff: not in repo", vim.log.levels.WARN) return end
	local relativePath = absolutePath:sub(#gitRoot + 2)
	if relativePath == "" then relativePath = vim.fn.fnamemodify(absolutePath, ":t") end
	local hunks
	vim.fn.system("git -C " .. vim.fn.shellescape(gitRoot) .. " ls-files --error-unmatch -- " .. vim.fn.shellescape(relativePath) .. " 2>/dev/null")
	if vim.v.shell_error ~= 0 then
		if #fileLines > 0 then hunks = { { added = { start = 1, count = #fileLines }, removed = { start = 0, count = 0 }, lines = {} } } end
	else hunks = parseHunks(vim.fn.systemlist("git -C " .. vim.fn.shellescape(gitRoot) .. " diff HEAD --unified=0 --no-color -- " .. vim.fn.shellescape(relativePath))) end
	if not hunks or #hunks == 0 then
		if sourceBuffer and vim.api.nvim_buf_is_valid(sourceBuffer) then local ok, gitsigns = pcall(require, "gitsigns") if ok then local gh = gitsigns.get_hunks(sourceBuffer) if gh and #gh > 0 then hunks = gh end end end
	end
	if not hunks or #hunks == 0 then vim.notify("No git changes", vim.log.levels.INFO) return end
	vim.cmd("tabnew")
	local diffBuffer = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(diffBuffer, 0, -1, false, fileLines)
	vim.bo[diffBuffer].buftype = "nofile"
	vim.bo[diffBuffer].bufhidden = "wipe"
	vim.bo[diffBuffer].swapfile = false
	vim.bo[diffBuffer].modifiable = false
	vim.bo[diffBuffer].filetype = filetype or ""
	for _, hunk in ipairs(hunks) do
		if hunk.added and hunk.added.count and hunk.added.count > 0 then pcall(vim.api.nvim_buf_set_extmark, diffBuffer, inlineDiffNamespace, hunk.added.start - 1, 0, { end_row = hunk.added.start - 1 + hunk.added.count, end_col = 0, hl_group = "DiffAdd" }) end
		if hunk.removed and hunk.removed.count and hunk.removed.count > 0 then
			local virtualLines = {}
			for _, lineText in ipairs(hunk.lines or {}) do if lineText:sub(1, 1) == "-" then virtualLines[#virtualLines + 1] = { { "- " .. lineText:sub(2), "DiffDelete" } } end end
			if #virtualLines > 0 then pcall(vim.api.nvim_buf_set_extmark, diffBuffer, inlineDiffNamespace, math.max((hunk.added and hunk.added.start or 1) - 1, 0), 0, { virt_lines = virtualLines, virt_lines_above = true }) end
		end
	end
	pcall(vim.api.nvim_buf_set_name, diffBuffer, "InlineGitDiff://" .. displayName)
	local items = normalize_hunks(hunks, math.max(#fileLines, 1))
	local added_total, removed_total = diff_totals(items)
	vim.b[diffBuffer].inline_diff_hunks = items
	vim.b[diffBuffer].inline_diff_file = displayName
	vim.b[diffBuffer].inline_diff_added = added_total
	vim.b[diffBuffer].inline_diff_removed = removed_total
	vim.keymap.set("n", "J", M.inline_diff_next, { buffer = diffBuffer, silent = true, desc = "Next diff hunk" })
	vim.keymap.set("n", "K", M.inline_diff_prev, { buffer = diffBuffer, silent = true, desc = "Previous diff hunk" })
	vim.keymap.set("n", "q", "<cmd>tabclose<cr>", { buffer = diffBuffer, silent = true, desc = "Close diff view" })
	vim.api.nvim_clear_autocmds({ group = inlineDiffGroup, buffer = diffBuffer })
	vim.api.nvim_create_autocmd({ "CursorMoved", "BufEnter" }, {
		group = inlineDiffGroup,
		buffer = diffBuffer,
		callback = function(args) update_diff_winbar(args.buf) end,
		desc = "Update InlineGitDiff winbar hunk counter",
	})
	if #items > 0 then
		pcall(vim.api.nvim_win_set_cursor, 0, { items[1].lnum, 0 })
		vim.cmd("normal! zz")
	end
	update_diff_winbar(diffBuffer)
end

vim.api.nvim_create_user_command("InlineGitDiff", function(options) local target = options.args ~= "" and vim.fn.expand(options.args) or nil if target and target ~= "" then M.inline_git_diff(nil, target) else M.inline_git_diff(vim.api.nvim_get_current_buf()) end end, { nargs = "?", complete = "file" })
return M
