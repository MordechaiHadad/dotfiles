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
		if hunk.added.count > 0 then pcall(vim.api.nvim_buf_set_extmark, diffBuffer, inlineDiffNamespace, hunk.added.start - 1, 0, { end_row = hunk.added.start - 1 + hunk.added.count, end_col = 0, hl_group = "DiffAdd" }) end
		if hunk.removed.count > 0 then
			local virtualLines = {}
			for _, lineText in ipairs(hunk.lines) do if lineText:sub(1, 1) == "-" then virtualLines[#virtualLines + 1] = { { "- " .. lineText:sub(2), "DiffDelete" } } end end
			if #virtualLines > 0 then pcall(vim.api.nvim_buf_set_extmark, diffBuffer, inlineDiffNamespace, math.max(hunk.added.start - 1, 0), 0, { virt_lines = virtualLines, virt_lines_above = true }) end
		end
	end
	pcall(vim.api.nvim_buf_set_name, diffBuffer, "InlineGitDiff://" .. displayName)
end

vim.api.nvim_create_user_command("InlineGitDiff", function(options) local target = options.args ~= "" and vim.fn.expand(options.args) or nil if target and target ~= "" then M.inline_git_diff(nil, target) else M.inline_git_diff(vim.api.nvim_get_current_buf()) end end, { nargs = "?", complete = "file" })
return M
