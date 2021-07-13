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

    -- Good stuff yo
    use {'akinsho/nvim-toggleterm.lua', config = require("plug-config.toggleterm")}

    -- UI
    use 'romgrk/barbar.nvim'
    -- use 'akinsho/nvim-bufferline.lua'
    use 'kyazdani42/nvim-tree.lua'
    use {'kyazdani42/nvim-web-devicons', module = "nvim-web-devicons"}
    use 'mhinz/vim-startify'
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main'}
        --use 'glepnir/dashboard-nvim'

        -- Colorscheme & Colors
        use 'MordechaiHadad/nvim-papadark' -- My Custom Colorscheme
        use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
        use 'nvim-treesitter/playground'
        use 'norcalli/nvim-colorizer.lua'
        use 'rktjmp/lush.nvim' -- Scheme creator

        -- Telescope
        use { 'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}, module = 'telescope',
        cmd = 'Telescope', config = require('plug-config.telescope')}

        -- Web Dev
        use 'windwp/nvim-ts-autotag'
        use {'turbio/bracey.vim', run = 'npm install --prefix server'}

        -- Autocomplete/LSP
        use {'hrsh7th/nvim-compe', config = require('plug-config.compe'), event = 'InsertEnter'}
        use {'norcalli/snippets.nvim', requires = 'hrsh7th/nvim-compe', after = 'nvim-compe'}
        use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe', after = 'snippets.nvim'}
        use {'neovim/nvim-lspconfig'}
        use {'kabouzeid/nvim-lspinstall', config = require('plug-config.lspinstall')}
        use 'folke/lsp-trouble.nvim'
        use 'glepnir/lspsaga.nvim'
        use 'simrat39/symbols-outline.nvim'

        -- Git
        use {
            'lewis6991/gitsigns.nvim',
            requires = {
                'nvim-lua/plenary.nvim'
            }
        }

        -- Editing Enhancments
        use {'b3nj5m1n/kommentary', event = 'BufWinEnter'}
        use {'windwp/nvim-autopairs', event = 'InsertEnter', config = require('plug-config.autopairs')}
        use {'folke/todo-comments.nvim', event = 'InsertEnter', requires = 'nvim-lua/plenary.nvim',
        config = require('plug-config.todo-comments')}


        -- General Plugins
        use 'ahmedkhalf/lsp-rooter.nvim'
        use {'folke/which-key.nvim', config = require('plug-config.which-key'), event = 'BufWinEnter'}
        use {'folke/persistence.nvim', event = 'BufWinEnter'}
        -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
    end)
