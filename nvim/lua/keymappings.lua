vim.g.mapleader = ' '

-- General Keymaps
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Open file explorer 
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, }) -- Save file in normal mode
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', { noremap = true}) -- Save file in insert mode
vim.api.nvim_set_keymap('n', 'tt', ':TSPlaygroundToggle<CR>', {noremap = true, silent = true}) -- Toggle TreeSitter playground

-- Finder keymaps
vim.api.nvim_set_keymap('n', 'ff', ':Telescope find_files<CR>', {noremap = true, silent = true}) -- Find files

-- LSP Keymaps
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true}) -- Go to Definitions
