return {
	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- nvim-colorizer requires termguicolors
			vim.o.termguicolors = true

			require("colorizer").setup({
				"*", -- highlight all filetypes
			}, {
				-- default options (optional)
				RGB = true, -- #RGB
				RRGGBB = true, -- #RRGGBB
				names = true, -- "Blue", "Gray", etc
				RRGGBBAA = false, -- #RRGGBBAA
				rgb_fn = true, -- rgb()/rgba()
				hsl_fn = true, -- hsl()/hsla()
				mode = "background",
			})
		end,
	},
}
