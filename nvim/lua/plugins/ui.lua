return {
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = {
            "nvim-tree/nvim-web-devicons", -- optional, for icons
            "famiu/bufdelete.nvim",
        },
        event = "VeryLazy",
        opts = {
            options = {
                show_close_icon = false,
                close_command = function(bufnr)
                    require("bufdelete").bufdelete(bufnr, true)
                end,
            },
        },
    },
    {
        "folke/trouble.nvim",
        opts = {},
        cmd = "Trouble",
    },
    {
        "folke/snacks.nvim",
        ---@type snacks.Config
        opts = {
            dashboard = { enabled = true },
            terminal = { enabled = true, shell = vim.o.shell },
            input = { enabled = true }, -- Makes Renaming and Inputs look sexy
            picker = { enabled = true }, -- Replaces Telescope for LSP selections
            indent = { enabled = true }, -- Better looking indent lines
            notifier = { enabled = true }, -- Better vim.notify messages
        },
    }
}
