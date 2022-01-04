vim.g.mapleader = " "

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- General Keymaps
keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", opts) -- Open file explorer
keymap("n", "<C-s>", ":w<CR>", opts) -- Save file in normal mode
keymap("i", "<C-s>", "<C-o>:w<CR>", opts) -- Save file in insert mode
keymap("n", "tt", ":TSPlaygroundToggle<CR>", opts) -- Toggle TreeSitter playground

-- Move selected line / block of text in visual mode
keymap( "x", "<C-Up>", "<Plug>GoVSMUp", {} )
keymap( "x", "<C-Down>", "<Plug>GoVSMDown", {} )

-- Move line in normal mode
keymap("n", "<C-Up>", "<Plug>GoNSMUp", {})
keymap("n", "<C-Down>", "<Plug>GoNSMDown", {})
-- Move line in insert mode
keymap("i", "<C-Up>", "<C-o><Plug>GoNSMUp", {})
keymap("i", "<C-Down>", "<C-o><Plug>GoNSMDown", {})


-- Telescope keymaps
keymap("n", "ff", ":Telescope find_files<CR>", opts) -- Find files
keymap("n", "fw", ":Telescope live_grep<CR>", opts)

-- LSP Keymaps
keymap("n", "gd", ":lua vim.lsp.buf.definition()<CR>", opts) -- Go to Definitions

-- fuck you deleted bullshit
keymap("n", "dd", '"_dd', opts)
