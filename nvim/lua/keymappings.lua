vim.g.mapleader = ' '

-- General Keymaps
vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Open file explorer 
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, }) -- Save file in normal mode
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', { noremap = true}) -- Save file in insert mode
vim.api.nvim_set_keymap('n', 'tt', ':TSPlaygroundToggle<CR>', {noremap = true, silent = true}) -- Toggle TreeSitter playground

-- Move selected line / block of text in visual mode
vim.api.nvim_set_keymap('x', '<C-Up>', ':move \'<-2<CR>gv-gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<C-Down>', ':move \'>+1<CR>gv-gv', {noremap = true, silent = true})

-- Move line in normal mode
vim.api.nvim_set_keymap('n', '<C-Up>', ':m .-2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-Down>', ':m .+1<CR>', {noremap = true, silent = true})
-- Move line in insert mode
vim.api.nvim_set_keymap('i', '<C-Up>', '<C-o>:m .-2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-Down>', '<C-o>:m .+1<CR>', {noremap = true, silent = true})

-- Finder keymaps
vim.api.nvim_set_keymap('n', 'ff', ':Telescope find_files<CR>', {noremap = true, silent = true}) -- Find files

-- LSP Keymaps
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.definition()<CR>', {noremap = true, silent = true}) -- Go to Definitions
