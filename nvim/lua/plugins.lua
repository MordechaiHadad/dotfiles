local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
	  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
	    execute 'packadd packer.nvim'
end -- Bootstrap packer so it auto installs everywhere

vim.cmd [[packadd packer.nvim]]

vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes to plugins.lua

return require('packer').startup(function(use)
	  -- Packer can manage itself as an optional plugin
	  use {'wbthomason/packer.nvim', opt = true}

      -- Good stuff yo
	  use 'voldikss/vim-floaterm'
      use 'windwp/nvim-autopairs'

      -- UI
	  use 'romgrk/barbar.nvim'
	  -- use 'akinsho/nvim-bufferline.lua'
	  use 'kyazdani42/nvim-tree.lua'
      use 'kyazdani42/nvim-web-devicons'
      use 'mhinz/vim-startify'
      use {
        'glepnir/galaxyline.nvim',
        branch = 'main'}
    -- use 'famiu/feline.nvim'
	  --use 'glepnir/dashboard-nvim'

      -- Colorscheme & Colors
      use 'MordechaiHadad/nvim-papadark' -- My Custom Colorscheme
      use {'MordechaiHadad/nvim-treesitter', run = ':TSUpdate'}
      use 'nvim-treesitter/playground'
      use 'norcalli/nvim-colorizer.lua'
      use 'rktjmp/lush.nvim' -- Scheme creator

	  -- Telescope
	  use { 'nvim-telescope/telescope.nvim',
	  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}}

      -- Web Dev
      use 'windwp/nvim-ts-autotag'
      use 'turbio/bracey.vim'

      -- Autocomplete/LSP
	  use 'hrsh7th/nvim-compe'
      use 'neovim/nvim-lspconfig'
      use 'kabouzeid/nvim-lspinstall'
      use 'folke/lsp-trouble.nvim'
      use 'glepnir/lspsaga.nvim'
      use {'tzachar/compe-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-compe'}

      -- Git
	  use {
		  'lewis6991/gitsigns.nvim',
		  requires = {
			  'nvim-lua/plenary.nvim'
          }
      }

      -- General Plugins
      use 'b3nj5m1n/kommentary'
	  use 'airblade/vim-rooter'
      use 'famiu/nvim-reload'
	  use 'folke/which-key.nvim'
      -- use {'lukas-reineke/indent-blankline.nvim', branch = 'lua'}
end)
