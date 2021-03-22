require('plugins')
require('settings')
require('colorscheme')
require('keymappings')

-- Plugins Config
require('plug-config/barbar')
require('plug-config/autopairs')
require('plug-config/floaterm')
require('plug-config/treesitter')
require('plug-config/colorizer')
require('plug-config/telescope')
require('plug-config/galaxyline')
require('plug-config/gitsigns')
require('plug-config/compe')
vim.cmd('source ~/.config/nvim/vimscript/startify.vim')
