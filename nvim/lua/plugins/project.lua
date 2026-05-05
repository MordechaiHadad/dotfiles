return {
  'DrKJeff16/project.nvim',
  log = { enabled = true },
  dependencies = { -- OPTIONAL. Choose any of the following
    {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' },
    },
  },
}
