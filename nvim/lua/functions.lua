local M = {}

local inline_diff_ns = vim.api.nvim_create_namespace("inline_git_diff")

function M.inline_git_diff(bufnr)
	local gs = require("gitsigns")
	local hunks = gs.get_hunks(bufnr)

	if not hunks or #hunks == 0 then
		vim.notify("No git changes", vim.log.levels.INFO)
		return
	end

	-- Collect everything from the source buffer before creating the temp buffer.
	local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
	local filetype = vim.bo[bufnr].filetype
	local name = vim.api.nvim_buf_get_name(bufnr)

	-- Open a normal temporary tab.
	vim.cmd("tabnew")

	local diff_buf = vim.api.nvim_get_current_buf()

	-- Copy the working-tree contents.
	vim.api.nvim_buf_set_lines(diff_buf, 0, -1, false, lines)

	-- Make it a temporary, non-file buffer.
	vim.bo[diff_buf].buftype = "nofile"
	vim.bo[diff_buf].bufhidden = "wipe"
	vim.bo[diff_buf].swapfile = false
	vim.bo[diff_buf].modifiable = false

	-- Preserve the normal filetype/syntax highlighting.
	vim.bo[diff_buf].filetype = filetype

	for _, hunk in ipairs(hunks) do
		-- Highlight actual working-tree additions/changes.
		if hunk.added.count > 0 then
			local start = hunk.added.start - 1
			local finish = start + hunk.added.count

			vim.api.nvim_buf_set_extmark(diff_buf, inline_diff_ns, start, 0, {
				end_row = finish,
				end_col = 0,
				hl_group = "DiffAdd",
			})
		end

		-- Render deleted HEAD lines as virtual lines.
		if hunk.removed.count > 0 then
			local deleted = {}

			for _, line in ipairs(hunk.lines) do
				if line:sub(1, 1) == "-" then
					table.insert(deleted, {
						{ "- " .. line:sub(2), "DiffDelete" },
					})
				end
			end

			if #deleted > 0 then
				vim.api.nvim_buf_set_extmark(diff_buf, inline_diff_ns, math.max(hunk.added.start - 1, 0), 0, {
					virt_lines = deleted,
					virt_lines_above = true,
				})
			end
		end
	end

	vim.api.nvim_buf_set_name(diff_buf, "InlineGitDiff://" .. name)
end

vim.api.nvim_create_user_command("InlineGitDiff", function()
	M.inline_git_diff(vim.api.nvim_get_current_buf())
end, {})

return M
