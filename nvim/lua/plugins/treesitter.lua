return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    config = function()
      -- Force Treesitter to use zig as the compiler to avoid the LoadLibrary 126 error.
      -- Make sure zig.exe is in your PATH.
      require("nvim-treesitter.install").compilers = { "zig" }

      -- Use the new main-branch API to install your desired parsers.
      require("nvim-treesitter").install({ 
        "lua", 
        "vim", 
        "vimdoc", 
        "rust", 
        "typescript", 
        "javascript", 
        "svelte",
        "zig" 
      })

      -- Start highlighting for the current buffer
      pcall(vim.treesitter.start)
    end,
  },
}

