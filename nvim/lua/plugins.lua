local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile")

local packer = require("packer")

packer.init({
	max_jobs = 4,
	profile = {
		enable = true,
	},
})

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Colorscheme
	use({ "/home/morde/repos/themer.lua", config = require("plug-config.themer") })
	use({ "nvim-treesitter/nvim-treesitter", config = require("plug-config.treesitter"), run = ":TSUpdate" })
	use({ "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" } })
	use({ "RRethy/vim-illuminate", config = require("plug-config.illuminate"), event = "BufWinEnter" })

	-- UI Stuff
	use({ "startup-nvim/startup.nvim", config = require("plug-config.startup") })
	use("kyazdani42/nvim-web-devicons")
	use({
		"luukvbaal/stabilize.nvim",
		config = function()
			require("stabilize").setup()
		end,
		event = "BufWinEnter",
	})

	-- Autocomplete
	use({ "hrsh7th/nvim-cmp", config = require("plug-config.cmp"), event = "BufWinEnter" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "L3MON4D3/LuaSnip", after = "nvim-cmp" })
	use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-calc", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
	use({ "PasiBergman/cmp-nuget", ft = "csproj" })
	use({ "tzachar/cmp-tabnine", run = "./install.sh", after = "nvim-cmp" })

	-- LSP
	use("neovim/nvim-lspconfig")
	use({ "jose-elias-alvarez/null-ls.nvim", config = require("plug-config.null-ls") })

	-- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-frecency.nvim",
				requires = { "tami5/sqlite.lua" },
				opt = true,
			},
		},
		cmd = "Telescope",
		config = require("plug-config.telescope"),
	})

	-- Git
	use({ "TimUntersberger/neogit", cmd = "Neogit" })

	-- Lang Dev
	use({ "p00f/godbolt.nvim", run = "rm -rf fnl/", event = "BufWinEnter", config = require("plug-config.godbolt") })

	-- General Plugins
	use({ "booperlv/nvim-gomove", config = require("plug-config.gomove"), event = "BufWinEnter" })
	use({ "ahmedkhalf/project.nvim", config = require("plug-config.project"), event = "BufWinEnter" })
	use({
		"michaelb/sniprun",
		run = "bash ./install.sh",
		config = function()
			require("sniprun").setup()
		end,
	}) -- Not Even working

	if packer_bootstrap then
		require("packer").sync()
	end
end)
