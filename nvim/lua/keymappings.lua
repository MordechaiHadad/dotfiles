vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', { noremap = true, silent = true }) -- Open file explorer 
vim.api.nvim_set_keymap('n', '<C-s>', ':w<CR>', { noremap = true, }) -- Save file in normal mode
vim.api.nvim_set_keymap('i', '<C-s>', '<C-o>:w<CR>', { noremap = true}) -- Save file in insert mode
vim.api.nvim_set_keymap('n', 'tt', ':TSPlaygroundToggle<CR>', {noremap = true, silent = true}) -- Toggle TreeSitter playground
vim.api.nvim_set_keymap('n', 'gd', ':call CocAction("jumpDefinition")<CR>', {noremap = true, silent = true})
