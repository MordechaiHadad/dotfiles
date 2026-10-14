local M = {}

M.cmd = "numbat"

local function has_snacks_terminal()
	return Snacks ~= nil and Snacks.terminal ~= nil
end

---Toggle a narrow numbat REPL on the right. Same call reuses the session.
function M.toggle()
	if vim.fn.executable(M.cmd) ~= 1 then
		vim.notify("numbat not found on $PATH", vim.log.levels.ERROR)
		return
	end
	if not has_snacks_terminal() then
		vim.notify("Snacks.terminal not available", vim.log.levels.ERROR)
		return
	end
	Snacks.terminal.toggle(M.cmd, {
		win = {
			position = "right",
			width = 0.3,
			min_width = 45,
			enter = true,
		},
		interactive = true,
	})
end

local function trim(s)
	return (s:gsub("^%s+", ""):gsub("%s+$", ""))
end

local function current_line_expr()
	return trim(vim.api.nvim_get_current_line())
end

local function visual_expr()
	-- Works for charwise/linewise visual selections. Joins lines with a space
	-- so multi-line selections become a single expression.
	local start_pos = vim.fn.getpos("'<")
	local end_pos = vim.fn.getpos("'>")
	local start_line, start_col = start_pos[2], start_pos[3]
	local end_line, end_col = end_pos[2], end_pos[3]
	if start_line > end_line or (start_line == end_line and start_col > end_col) then
		start_line, end_line = end_line, start_line
		start_col, end_col = end_col, start_col
	end
	local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	if #lines == 0 then
		return ""
	end
	if #lines == 1 then
		return trim(string.sub(lines[1], start_col, end_col))
	end
	lines[1] = string.sub(lines[1], start_col)
	lines[#lines] = string.sub(lines[#lines], 1, end_col)
	for i, line in ipairs(lines) do
		lines[i] = trim(line)
	end
	return trim(table.concat(lines, " "))
end

---Evaluate an expression headlessly and yank the result to the + register.
---@param expr string
local function evaluate(expr)
	expr = trim(expr)
	if expr == "" then
		vim.notify("nothing to evaluate", vim.log.levels.WARN)
		return
	end
	if vim.fn.executable(M.cmd) ~= 1 then
		vim.notify("numbat not found on $PATH", vim.log.levels.ERROR)
		return
	end
	vim.system({ M.cmd, "--color=never", "-e", expr }, { text = true }, function(res)
		vim.schedule(function()
			if res.code ~= 0 then
				local err = trim(res.stderr ~= "" and res.stderr or res.stdout)
				if err == "" then
					err = "numbat failed (exit " .. res.code .. ")"
				end
				vim.notify(err, vim.log.levels.ERROR)
				return
			end
			local out = trim(res.stdout)
			if out == "" then
				vim.notify("numbat returned no output", vim.log.levels.WARN)
				return
			end
			vim.fn.setreg("+", out)
			vim.notify(out, vim.log.levels.INFO)
		end)
	end)
end

---Evaluate the current line (normal mode).
function M.evaluate_line()
	evaluate(current_line_expr())
end

---Evaluate the visual selection (visual mode). Exits visual mode first so
---'< and '> marks are stable.
function M.evaluate_visual()
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
	vim.schedule(function()
		evaluate(visual_expr())
	end)
end

return M
