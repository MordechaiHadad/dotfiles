--         ╭──────────────────────────────────────────────────────────╮
--         │                           Plugins                        │
--         ╰──────────────────────────────────────────────────────────╯

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
    use({ "/home/morde/repos/themer.lua", config = require("plugins.configs.themer") })
    use({ "nvim-treesitter/nvim-treesitter", config = require("plugins.configs.treesitter"), run = ":TSUpdate" })
    use({ "nvim-treesitter/playground", cmd = { "TSPlaygroundToggle", "TSHighlightCapturesUnderCursor" } })
    use({ "RRethy/vim-illuminate", config = require("plugins.configs.illuminate"), event = "BufWinEnter" })
    use({
        "zbirenbaum/neodim",
        config = function()
            require("neodim").setup()
        end,
    })

    -- UI
    use({ "akinsho/bufferline.nvim", branch = "dev", config = require("plugins.configs.bufferline") })
    use({ "rebelot/heirline.nvim", config = require("plugins.configs.heirline") })
    use({ "kyazdani42/nvim-tree.lua", config = require("plugins.configs.nvim-tree"), cmd = "NvimTreeToggle" })
    use({ "startup-nvim/startup.nvim", config = require("plugins.configs.startup") })
    use("kyazdani42/nvim-web-devicons")
    use({
        "luukvbaal/stabilize.nvim",
        config = function()
            require("stabilize").setup()
        end,
        event = "BufWinEnter",
    })
    use({ "folke/trouble.nvim", config = require("plugins.configs.lsp-trouble"), event = "BufWinEnter" }) -- Buggy F
    use({ "famiu/bufdelete.nvim" })
    use({
        "SmiteshP/nvim-navic",
        requires = {
            "neovim/nvim-lspconfig",
            "williamboman/nvim-lsp-installer",
        },
        config = require("nvim-navic").setup({}),
    })

    -- Autocomplete
    use({ "hrsh7th/nvim-cmp", config = require("plugins.configs.cmp"), event = "BufWinEnter" })
    use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
    use({ "rafamadriz/friendly-snippets", after = "nvim-cmp" })
    use({ "L3MON4D3/LuaSnip", config = require("plugins.configs.luasnip"), after = "nvim-cmp" })
    use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-calc", after = "nvim-cmp" })
    use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
    use({ "PasiBergman/cmp-nuget", ft = "csproj" })
    use({ "tzachar/cmp-tabnine", run = "./install.sh", after = "nvim-cmp" })

    -- LSP
    use("neovim/nvim-lspconfig")
    use({ "jose-elias-alvarez/null-ls.nvim", config = require("plugins.configs.null-ls") })
    use({ "williamboman/nvim-lsp-installer", config = require("plugins.configs.nvim-lsp-installer") })
    use({
        "simrat39/rust-tools.nvim",
        config = function()
            require("rust-tools").setup({})
        end,
        ft = "rs",
    })

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
        module = "telescope",
        config = require("plugins.configs.telescope"),
    })
    use({
        "AckslD/nvim-neoclip.lua",
        requires = {
            { "tami5/sqlite.lua", module = "sqlite" },
        },
        config = require("plugins.configs.neoclip"),
        after = "telescope.nvim",
    })

    -- Git
    use({
        "TimUntersberger/neogit",
        cmd = "Neogit",
        module = "neogit",
        requires = {
            "nvim-lua/plenary.nvim",
            "sindrets/diffview.nvim",
        },
        config = require("plugins.configs.neogit"),
    })
    use({
        "lewis6991/gitsigns.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = require("plugins.configs.gitsigns"),
        event = "BufWinEnter",
    })

    -- Lang Dev
    use({
        "p00f/godbolt.nvim",
        run = "rm -rf fnl/",
        event = "BufWinEnter",
        config = require("plugins.configs.godbolt"),
    })

    -- Web Dev
    use({ "windwp/nvim-ts-autotag", ft = { "html", "svelte" } })

    -- Note Taking
    use({ "nvim-neorg/neorg", config = require("plugins.configs.neorg"), ft = "norg" })
    use({ "max397574/neorg-kanban", opt = true })

    -- Editing Enhancments
    use({ "windwp/nvim-autopairs", event = "InsertEnter", config = require("plugins.configs.autopairs") })
    use({
        "folke/todo-comments.nvim",
        event = "BufWinEnter",
        requires = "nvim-lua/plenary.nvim",
        config = require("plugins.configs.todo-comments"),
    })
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
        event = "BufWinEnter",
    })

    -- General Plugins
    use({ "fedepujol/move.nvim", event = "BufWinEnter" })
    use("LudoPinelli/comment-box.nvim") -- No idea how this works
    -- use({
    --     "rmagatti/goto-preview",
    --     config = function()
    --         require("goto-preview").setup({})
    --     end,
    -- })
    use({ "akinsho/toggleterm.nvim", config = require("plugins.configs.toggleterm"), keys = "<F12>" })
    use({ "max397574/which-key.nvim", config = require("plugins.configs.which-key"), event = "BufWinEnter" })
    use({
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = require("plugins.configs.persistence"),
    })
    use({ "ahmedkhalf/project.nvim", config = require("plugins.configs.project"), event = "BufWinEnter" })

    if packer_bootstrap then
        require("packer").sync()
    end
end)
