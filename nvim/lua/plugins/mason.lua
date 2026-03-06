return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        -- install non-Rust servers here
        "svelte",
        "lua_ls",
      },
      -- IMPORTANT: don't auto-setup rust_analyzer if using rustaceanvim
      -- (prevents conflicts / double setup)
      handlers = {
        ["rust_analyzer"] = function() end,
      },
    },
  },
}
