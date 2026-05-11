vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- General Keymaps
keymap("n", "<Leader>e", ":Neotree<CR>", opts) -- Open file explorer
keymap("n", "tt", "<cmd>InspectTree<CR>", opts) -- Toggle TreeSitter playground
keymap({ "i", "n" }, "<C-s>", "<cmd>:w<cr><esc>", opts) -- Save file in insert mode

-- Move line in insert mode
keymap("i", "<C-Up>", ":MoveLine(-1)<CR>", opts)
keymap("i", "<C-Down>", ":MoveLine(1)<CR>", opts)

-- Telescope keymaps
keymap("n", "ff", ":Telescope find_files<CR>", opts) -- Find files
keymap("n", "fw", ":Telescope live_grep<CR>", opts)

-- LSP Keymaps
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Go to Definitions
keymap("n", "<F2>", ":lua vim.lsp.buf.rename() <CR>", opts) -- Rename symbol

-- Terminal keymaps
keymap("n", "<A-t>", function()
	Snacks.terminal.toggle()
end, {
	desc = "Toggle terminal",
})

-- fuck you deleted bullshit
keymap("n", "dd", '"_dd', opts)

keymap("n", "xx", function()
	local line = vim.fn.getline(".")
	vim.api.nvim_del_current_line()
	vim.fn.setreg("+", line)
end, opts) -- Replace dd to yank and delete

-- Bufferline
keymap("n", "<TAB>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", opts)

keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>") -- Exit search mode

local whichkey_ok, whichkey = pcall(require, "which-key")

if whichkey_ok then
	-- Which key base
	whichkey.add({
		{
			"<leader>f",
			function()
				vim.lsp.buf.format({ async = true })
			end,
			desc = "format buffer",
		},
	})

	-- Which key trouble
	whichkey.add({
		{ "<leader>t", group = "trouble" },
		{ "<leader>tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
		{
			"<leader>tT",
			"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
			desc = "Buffer Diagnostics (Trouble)",
		},
		{ "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
		{
			"<leader>tr",
			"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
			desc = "LSP Definitions / References (Trouble)",
		},
		{
			"<leader>tl",
			"<cmd>Trouble loclist toggle<cr>",
			desc = "Location List (Trouble)",
		},
		{
			"<leader>tq",
			"<cmd>Trouble qflist toggle<cr>",
			desc = "Quickfix List (Trouble)",
		},
	})

	whichkey.add({
		{ "<leader>c", group = "code actions" },
		{ "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
		{ "<leader>cr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename Symbol" },
		{ "<leader>ch", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
	})
end
