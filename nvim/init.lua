require('plugins')
require('settings')
require('colorscheme')
require('keymappings')
require('lsp')

-- Plugins Config
require('plug-config/treesitter')
require('plug-config/colorizer')
require('plug-config/lspsaga')
vim.cmd('source ~/.config/nvim/vimscript/startify.vim')
