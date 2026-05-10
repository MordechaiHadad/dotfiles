return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        dashboard = { enabled = true },
        terminal = { enabled = true, shell = vim.o.shell, },
        input = { enabled = true },    -- Makes Renaming and Inputs look sexy
        picker = { enabled = true },   -- Replaces Telescope for LSP selections
        indent = { enabled = true },   -- Better looking indent lines
        notifier = { enabled = true }, -- Better vim.notify messages
    }
}
