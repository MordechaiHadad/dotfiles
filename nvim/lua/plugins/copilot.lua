return {
  {
    "github/copilot.vim",
    lazy = false
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- required auth/token provider
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    -- build = "make tiktoken", -- only for Mac/Linux per docs; skip on Windows
    opts = {},
    cmd = {
      "CopilotChat",
      "CopilotChatOpen",
      "CopilotChatToggle",
      "CopilotChatModels",
      "CopilotChatPrompts",
    },
  },
}

