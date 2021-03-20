vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Open file explorer 
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, silent = true }) -- Save file
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', { noremap = true})
