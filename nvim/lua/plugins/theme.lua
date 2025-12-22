return {
  {
    "Mofiqul/vscode.nvim",
    lazy = false,      -- load at startup so colors apply immediately
    priority = 1000,   -- load before most plugins
    config = function()
      -- pick one:
      vim.cmd.colorscheme("vscode") -- Dark+
      -- vim.cmd.colorscheme("vscode_light") -- Light+
    end,
  },
}

-- return {
--   {
--     "ThemerCorp/themer.lua",
--     opts = {
--       colorscheme = "papa_dark",
--     },
--     config = function(_, opts)
--       require("themer").setup(opts)
--     end,
--   },
-- }
