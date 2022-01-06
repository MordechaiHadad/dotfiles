local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end -- Bootstrap packer so it auto installs everywhere

vim.cmd([[packadd packer.nvim]])

vim.cmd("autocmd BufWritePost plugins.lua PackerCompile") -- Auto compile when there are changes to plugins.lua
local packer = require("packer")

packer.init({
    max_jobs = 4,
    profile = {
        enable = true,
    },
})

return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use({ "wbthomason/packer.nvim", opt = true })

    -- UI
    use({ "startup-nvim/startup.nvim", config = require("plug-config.startup") })
    use({ "romgrk/barbar.nvim", config = require("plug-config.barbar") })
    use({ "nvim-lualine/lualine.nvim", config = require("plug-config.lualine") })
    -- use({ "NTBBloodbath/galaxyline.nvim", config = require("plug-config.galaxyline")})
    use({ "kyazdani42/nvim-tree.lua", config = require("plug-config.nvim-tree"), cmd = "NvimTreeToggle" })
    use({ "kyazdani42/nvim-web-devicons", module = "nvim-web-devicons" })
    use({ "akinsho/toggleterm.nvim", config = require("plug-config.toggleterm"), keys = "<F12>" })
    use({ "folke/trouble.nvim", config = require("plug-config.lsp-trouble"), event = "BufWinEnter" })

    -- Colorscheme & Colors
    use({
        "/home/morde/repos/themer.lua",
        branch = "dev",
        config = require("plug-config.themer"),
    })
    use({ "nvim-treesitter/nvim-treesitter", config = require("plug-config.treesitter"), run = ":TSUpdate" })
    use({ "nvim-treesitter/playground", cmd = "TSPlaygroundToggle" })
    use({ "norcalli/nvim-colorizer.lua", config = require("plug-config.colorizer") })
    use({ "RRethy/vim-illuminate", config = require("plug-config.illuminate"), event = "BufWinEnter" })

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
        cmd = "Telescope",
        config = require("plug-config.telescope"),
    })
    use({
        "nvim-telescope/telescope-frecency.nvim",
        requires = { "tami5/sql.nvim" },
        cmd = "Telescope",
    })

    -- Web Dev
    use({ "windwp/nvim-ts-autotag", ft = { "html", "svelte" } })
    use({
        "themaxmarchuk/tailwindcss-colors.nvim",
        ft = { "html", "svelte" },
        config = require("plug-config.tailwindcss-colors"),
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

    -- LSP
    use({ "neovim/nvim-lspconfig" })
    use({ "jose-elias-alvarez/null-ls.nvim", config = require("plug-config.null-ls") })

    -- Git
    use({
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = require("plug-config.gitsigns"),
        event = "BufWinEnter",
    })
    use({
        "TimUntersberger/neogit",
        cmd = "Neogit"
    })

    -- Editing Enhancments
    use({ "b3nj5m1n/kommentary", event = "BufWinEnter" })
    use({ "windwp/nvim-autopairs", after = "nvim-cmp", config = require("plug-config.autopairs") })
    use({
        "folke/todo-comments.nvim",
        event = "InsertEnter",
        requires = "nvim-lua/plenary.nvim",
        config = require("plug-config.todo-comments"),
    })
    use({ "booperlv/nvim-gomove", config = require("plug-config.gomove"), event = "BufWinEnter" })

    -- Lang-dev
    use({ "p00f/godbolt.nvim", run = "rm -rf fnl/", event = "BufWinEnter", config = require("plug-config.godbolt") })

    -- General Plugins
    use({ "ahmedkhalf/project.nvim", config = require("plug-config.project"), event = "BufWinEnter" })
    use({ "folke/which-key.nvim", config = require("plug-config.which-key"), event = "BufWinEnter" })
    use({
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = require("plug-config.persistence"),
    })
    use({ "nvim-neorg/neorg", config = require("plug-config.neorg"), ft = "norg" })
    use({
        "abecodes/tabout.nvim",
        config = function()
            require("tabout").setup()
        end,
        event = "BufWinEnter",
    })
    use({ "folke/lua-dev.nvim" })

    use({ "nanotee/luv-vimdocs" })
    use({
        "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup()
        end,
        event = "BufWinEnter",
    })

    use({
        "anuvyklack/pretty-fold.nvim",
        config = function()
            require("pretty-fold").setup({})
        end,
    })

    -- Self plugin
    use({ "/home/morde/repos/nvim-lspmanager", config = require("plug-config.lspmanager") })
end)
