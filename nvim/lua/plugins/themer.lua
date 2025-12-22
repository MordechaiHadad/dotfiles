return {
  {
    "ThemerCorp/themer.lua",
    opts = {
      colorscheme = "papa_dark",
    },
    config = function(_, opts)
      require("themer").setup(opts)
    end,
  },
}

