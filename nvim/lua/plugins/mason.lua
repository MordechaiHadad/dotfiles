return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
        },
        opts = {
            ensure_installed = {
                -- install non-Rust servers here
                "svelte",
                "lua_ls",
            },
            automatic_enable = {
                exclude = { "rust_analyzer" }
            },
            -- IMPORTANT: don't auto-setup rust_analyzer if using rustaceanvim
            -- (prevents conflicts / double setup)
            handlers = {
                ["rust_analyzer"] = function() end,
            },
        },
    },
}
