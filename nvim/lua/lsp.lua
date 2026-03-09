vim.diagnostic.config({
    signs = false,

    -- Enable virtual text (the text at the end of the line)
    virtual_text = {
        spacing = 4,
        prefix = "●",
    },

    update_in_insert = true,

    severity_sort = true,

    -- Floating window settings (e.g., when you hover over an error)
    float = {
        border = "single",
        source = "always", -- Shows which LSP sent the error (rust_analyzer, etc.)
    },
})
-- Neovim 0.11+: set global defaults for *all* LSP servers.
if vim.lsp and vim.lsp.config then
    vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
    })
end
