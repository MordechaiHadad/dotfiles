local M = {}

local inline_diff_ns = vim.api.nvim_create_namespace("inline_git_diff")

local function find_buf_for_path(abs_path)
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_valid(buf) then
			local name = vim.api.nvim_buf_get_name(buf)
			if name ~= "" and vim.fn.fnamemodify(name, ":p") == abs_path then
				return buf
			end
		end
	end
	return nil
end

local function get_git_root(path)
	local dir = vim.fn.fnamemodify(path, ":h")
	if dir == "" then
		dir = "."
	end
	if vim.fs and vim.fs.root then
		local root = vim.fs.root(dir, ".git")
		if root then
			return root
		end
	end
	local ok, result = pcall(function()
		if vim.system then
			local obj = vim.system({ "git", "rev-parse", "--show-toplevel" }, { text = true, cwd = dir }):wait()
			if obj.code == 0 and obj.stdout then
				return vim.trim(obj.stdout)
			end
		end
		return nil
	end)
	if ok and result and result ~= "" then
		return result
	end
	local out = vim.fn.systemlist("git -C " .. vim.fn.shellescape(dir) .. " rev-parse --show-toplevel 2>/dev/null")
	if out[1] and out[1] ~= "" then
		return out[1]
	end
	return nil
end

local function is_tracked(git_root, rel_path)
	if vim.system then
		local obj = vim.system(
			{ "git", "-C", git_root, "ls-files", "--error-unmatch", "--", rel_path },
			{ text = true }
		)
			:wait()
		return obj.code == 0
	end
	vim.fn.system(
		"git -C "
			.. vim.fn.shellescape(git_root)
			.. " ls-files --error-unmatch -- "
			.. vim.fn.shellescape(rel_path)
			.. " 2>/dev/null"
	)
	return vim.v.shell_error == 0
end

local function parse_unified0(diff_lines)
	local hunks = {}
	local idx = 1
	while idx <= #diff_lines do
		local line = diff_lines[idx]
		local a_start, a_count, b_start, b_count = line:match("^@@ %-(%d+),?(%d*) %+(%d+),?(%d*) @@")
		if a_start then
			a_start = tonumber(a_start)
			a_count = a_count == "" and 1 or tonumber(a_count)
			b_start = tonumber(b_start)
			b_count = b_count == "" and 1 or tonumber(b_count)
			local hunk_lines = {}
			idx = idx + 1
			while idx <= #diff_lines do
				local candidate = diff_lines[idx]
				if
					candidate:match("^@@ ")
					or candidate:match("^diff ")
					or candidate:match("^index ")
					or candidate:match("^%-%-%- ")
					or candidate:match("^%+%+%+ ")
				then
					break
				end
				table.insert(hunk_lines, candidate)
				idx = idx + 1
			end
			table.insert(hunks, {
				added = { start = b_start, count = b_count },
				removed = { start = a_start, count = a_count },
				lines = hunk_lines,
			})
		else
			idx = idx + 1
		end
	end
	return hunks
end

local function get_hunks_via_git(abs_path, git_root, rel_path)
	local diff_lines = {}
	if vim.system then
		local obj = vim.system(
			{ "git", "-C", git_root, "diff", "HEAD", "--unified=0", "--no-color", "--", rel_path },
			{ text = true }
		):wait()
		if obj.stdout and obj.stdout ~= "" then
			diff_lines = vim.split(obj.stdout, "\n", { plain = true })
		end
	else
		diff_lines = vim.fn.systemlist(
			"git -C "
				.. vim.fn.shellescape(git_root)
				.. " diff HEAD --unified=0 --no-color -- "
				.. vim.fn.shellescape(rel_path)
		)
	end
	return parse_unified0(diff_lines)
end

function M.inline_git_diff(bufnr, target_path)
	local path = target_path
	local provided_buf = nil

	if type(bufnr) == "string" and not path then
		path = bufnr
		bufnr = nil
	end

	if bufnr and vim.api.nvim_buf_is_valid(bufnr) then
		provided_buf = bufnr
	end

	if not path or path == "" then
		if provided_buf then
			path = vim.api.nvim_buf_get_name(provided_buf)
		end
	end

	if not path or path == "" then
		path = vim.api.nvim_buf_get_name(0)
	end

	if not path or path == "" then
		vim.notify("inline_git_diff: no file path", vim.log.levels.WARN)
		return
	end

	local abs_path = vim.fn.fnamemodify(path, ":p")

	local source_buf = provided_buf
	if not source_buf or not vim.api.nvim_buf_is_valid(source_buf) then
		source_buf = find_buf_for_path(abs_path)
	end

	local lines
	local filetype
	local display_name = abs_path
	local is_buffer_source = false

	if source_buf and vim.api.nvim_buf_is_valid(source_buf) and vim.api.nvim_buf_is_loaded(source_buf) then
		local buf_name = vim.api.nvim_buf_get_name(source_buf)
		if buf_name ~= "" and vim.fn.fnamemodify(buf_name, ":p") == abs_path then
			lines = vim.api.nvim_buf_get_lines(source_buf, 0, -1, false)
			filetype = vim.bo[source_buf].filetype
			display_name = buf_name
			is_buffer_source = true
		end
	end

	if not lines then
		if vim.fn.filereadable(abs_path) == 0 then
			vim.notify("inline_git_diff: file not readable: " .. abs_path, vim.log.levels.WARN)
			return
		end
		lines = vim.fn.readfile(abs_path)
		if vim.filetype and vim.filetype.match then
			filetype = vim.filetype.match({ filename = abs_path }) or ""
		end
		if not filetype or filetype == "" then
			filetype = vim.bo[0].filetype or ""
		end
	end

	if not filetype then
		filetype = ""
	end

	local git_root = get_git_root(abs_path)
	if not git_root then
		vim.notify("inline_git_diff: not in git repo", vim.log.levels.WARN)
		return
	end

	local rel_path = abs_path:sub(#git_root + 2)
	if rel_path == "" then
		rel_path = vim.fn.fnamemodify(abs_path, ":t")
	end

	local hunks = {}
	local tracked = is_tracked(git_root, rel_path)

	if not tracked then
		if #lines > 0 then
			hunks = {
				{
					added = { start = 1, count = #lines },
					removed = { start = 0, count = 0 },
					lines = {},
				},
			}
			for _, line in ipairs(lines) do
				table.insert(hunks[1].lines, "+" .. line)
			end
		end
	else
		hunks = get_hunks_via_git(abs_path, git_root, rel_path)
	end

	if not hunks or #hunks == 0 then
		if source_buf and vim.api.nvim_buf_is_valid(source_buf) then
			local ok, gs = pcall(require, "gitsigns")
			if ok then
				local gs_hunks = gs.get_hunks(source_buf)
				if gs_hunks and #gs_hunks > 0 then
					hunks = gs_hunks
				end
			end
		end
	end

	if not hunks or #hunks == 0 then
		vim.notify("No git changes", vim.log.levels.INFO)
		return
	end

	vim.cmd("tabnew")
	local diff_buf = vim.api.nvim_get_current_buf()
	vim.api.nvim_buf_set_lines(diff_buf, 0, -1, false, lines)
	vim.bo[diff_buf].buftype = "nofile"
	vim.bo[diff_buf].bufhidden = "wipe"
	vim.bo[diff_buf].swapfile = false
	vim.bo[diff_buf].modifiable = false
	vim.bo[diff_buf].filetype = filetype

	for _, hunk in ipairs(hunks) do
		if hunk.added.count > 0 then
			local start = hunk.added.start - 1
			local finish = start + hunk.added.count
			pcall(vim.api.nvim_buf_set_extmark, diff_buf, inline_diff_ns, start, 0, {
				end_row = finish,
				end_col = 0,
				hl_group = "DiffAdd",
			})
		end
		if hunk.removed.count > 0 then
			local deleted = {}
			for _, line in ipairs(hunk.lines) do
				if line:sub(1, 1) == "-" then
					table.insert(deleted, { { "- " .. line:sub(2), "DiffDelete" } })
				end
			end
			if #deleted > 0 then
				pcall(vim.api.nvim_buf_set_extmark, diff_buf, inline_diff_ns, math.max(hunk.added.start - 1, 0), 0, {
					virt_lines = deleted,
					virt_lines_above = true,
				})
			end
		end
	end

	pcall(vim.api.nvim_buf_set_name, diff_buf, "InlineGitDiff://" .. display_name)
end

vim.api.nvim_create_user_command("InlineGitDiff", function(opts)
	local target = nil
	if opts.args and opts.args ~= "" then
		target = vim.fn.expand(opts.args)
	end
	if target and target ~= "" then
		M.inline_git_diff(nil, target)
	else
		M.inline_git_diff(vim.api.nvim_get_current_buf())
	end
end, { nargs = "?", complete = "file" })

return M
