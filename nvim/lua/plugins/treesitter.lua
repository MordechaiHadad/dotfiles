return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main", -- Switched to the modern branch for Neovim 0.12+
		build = ":TSUpdate",
		config = function()
			-- The top-level module is now used directly
			require("nvim-treesitter").setup()

			local ensure_installed = {
				"lua",
				"vim",
				"vimdoc",
				"rust",
				"typescript",
				"javascript",
				"svelte",
				"python",
				"zig",
				"json",
				"html",
				"css",
				"bash",
				"markdown",
				"scss",
				"yaml",
				"toml",
				"c_sharp",
				"diff",
			}

			-- The rewrite handles installations through an explicit function call
			require("nvim-treesitter").install(ensure_installed)

			-- Core Neovim now manages highlighting natively, so we hook it via an autocmd
			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					pcall(vim.treesitter.start)
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			enable = true,
			multiwindow = false,
			max_lines = 0,
			min_window_height = 0,
			line_numbers = true,
			multiline_threshold = 20,
			trim_scope = "outer",
			mode = "cursor",
			separator = nil,
			zindex = 20,
			on_attach = nil,
		},
	},
}
