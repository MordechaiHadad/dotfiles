return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		pickers = {
			live_grep = {
				additional_args = function()
					return { "--ignore-case" }
				end,
			},
		},
	},
}
