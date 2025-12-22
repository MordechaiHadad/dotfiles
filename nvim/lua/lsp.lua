vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false,
    update_in_insert = true,
    virtual_text = false,
    severity_sort = true,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
})


-- Neovim 0.11+: set global defaults for *all* LSP servers.
if vim.lsp and vim.lsp.config then
  vim.lsp.config("*", {
    capabilities = require("blink.cmp").get_lsp_capabilities(),
  })
end
