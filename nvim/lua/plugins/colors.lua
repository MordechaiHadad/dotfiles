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
	{
		"ALVAROPING1/neodim", -- Point to the fork instead of zbirenbaum/neodim
		branch = "fix-nvim-0.11", -- Explicitly track the fix branch
		event = "LspAttach",
		config = function()
			require("neodim").setup({
				alpha = 0.75, -- Lower this down to ensure you can see the dimming clearly
				blend_color = nil,
				hide = {
					underline = true,
					virtual_text = true,
					signs = true,
				},
				regex = {
					"[uU]nused",
					"[nN]ever [rR]ead",
					"[nN]ot [rR]ead",
				},
				priority = 128,
				disable = {},
			})
		end,
	},
}
