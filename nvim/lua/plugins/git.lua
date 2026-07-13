return {
	{
		"lewis6991/gitsigns.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"barrettruth/diffs.nvim",
		-- Lazy-load on the plugin's user commands to keep startup instant
		cmd = { "Diff" },
		init = function()
			-- Define global configuration settings before the module loads
			vim.g.diffs = {
				integrations = {
					gitsigns = true,
				},
			}
		end,
	},
}
