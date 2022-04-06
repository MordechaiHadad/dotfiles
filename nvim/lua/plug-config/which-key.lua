return function()
    require("which-key").setup({
        window = {
            border = "single",
        },
    })

    local wk = require("which-key")

    wk.register({
        r = {
            name = "Refactor",
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename Symbol" },
        },
        f = { "<cmd>lua vim.lsp.buf.formatting_sync()<cr>", "Format Document" },
        g = { "<cmd>Godbolt<cr>", "Godbolt Explore Current Document" },
    }, {
        prefix = "<leader>",
    })
end
