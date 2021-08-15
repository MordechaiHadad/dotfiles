local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
    execute 'packadd packer.nvim'
end -- Bootstrap packer so it auto installs everywhere

vim.cmd [[packadd packer.nvim]]

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes to plugins.lua
local packer = require('packer')

packer.init({
    max_jobs = 6,
    profile = {
        enable = true,
    },
})

return require('packer').startup(function(use)
    -- Packer can manage itself as an optional plugin
    use {'wbthomason/packer.nvim', opt = true}

    -- UI
    use {'romgrk/barbar.nvim', config = require('plug-config.barbar')}
    use 'kyazdani42/nvim-tree.lua'
    use {'kyazdani42/nvim-web-devicons', module = "nvim-web-devicons"}
    use 'mhinz/vim-startify'
    use {'glepnir/galaxyline.nvim', branch = 'main', config = require('plug-config.galaxyline')}
    use {'numToStr/FTerm.nvim', config = require('plug-config.FTerm')}
    use {'folke/trouble.nvim', config = require('plug-config.lsp-trouble'), event = 'BufWinEnter'}

    -- Colorscheme & Colors
    use '/home/morde/repos/nvim-papadark' -- Colorscheme
    use {'nvim-treesitter/nvim-treesitter', config = require('plug-config.treesitter'), run = ':TSUpdate'}
    use 'nvim-treesitter/playground'
    use 'norcalli/nvim-colorizer.lua'
    use 'rktjmp/lush.nvim' -- Scheme creator

    -- Telescope
    use { 'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    cmd = 'Telescope', config = require('plug-config.telescope')}
    use {'nvim-telescope/telescope-frecency.nvim', requires = {'tami5/sql.nvim'},
    after = 'telescope.nvim', config = require('plug-config.frecency')}

    -- Web Dev
    use 'windwp/nvim-ts-autotag'

    -- Autocomplete/LSP
    use {'hrsh7th/nvim-compe', config = require('plug-config.compe'), event = 'InsertEnter'}
    use {'norcalli/snippets.nvim', requires = 'hrsh7th/nvim-compe', after = 'nvim-compe'}
    use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe', after = 'snippets.nvim'}
    use {'neovim/nvim-lspconfig'}
    use {'/home/morde/repos/nvim-lspinstall', config = require('plug-config.lspinstall')}
    use 'glepnir/lspsaga.nvim'

    -- Git
    use {'lewis6991/gitsigns.nvim', requires ='nvim-lua/plenary.nvim'}

    -- Editing Enhancments
    use {'b3nj5m1n/kommentary', event = 'BufWinEnter'}
    use {'windwp/nvim-autopairs', event = 'InsertEnter', config = require('plug-config.autopairs')}
    use {'folke/todo-comments.nvim', event = 'InsertEnter', requires = 'nvim-lua/plenary.nvim',
    config = require('plug-config.todo-comments')}


    -- General Plugins
    use {'ahmedkhalf/project.nvim', config = require('plug-config.project')}
    use {'folke/which-key.nvim', config = require('plug-config.which-key'), event = 'BufWinEnter'}
    use {'folke/persistence.nvim', event = 'BufReadPre', module = 'persistence', config = function()
        require('persistence').setup()
    end}
end)
