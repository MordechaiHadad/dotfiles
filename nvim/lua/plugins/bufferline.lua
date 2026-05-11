return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for icons
			"famiu/bufdelete.nvim",
		},
		event = "VeryLazy",
		opts = {
			options = {
				show_close_icon = false,
				close_command = function(bufnr)
					require("bufdelete").bufdelete(bufnr, true)
				end,
			},
		},
	},
}
