return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"nvim-tree/nvim-web-devicons",
			"lewis6991/gitsigns.nvim",
		},
		opts = {
			sources = {
				"filesystem",
				"git_status",
				"document_symbols",
			},
			source_selector = {
				winbar = true,
				statusline = false,
				sources = {
					{ source = "filesystem", display_name = " 󰉓 Files " },
					{ source = "git_status", display_name = " 󰊢 Git " },
					{ source = "document_symbols", display_name = "  Symbols " },
				},
			},
			git_status = {
				window = {
					mappings = {
						["<CR>"] = "open_and_diff",
					},
				},
				commands = {
					open_and_diff = function(state)
						local node = state.tree:get_node()
						if not node then
							return
						end
						if node.type and node.type ~= "file" then
							return
						end
						local path = node.path or (node.get_id and node:get_id())
						if not path or path == "" then
							return
						end
						require("functions").inline_git_diff(nil, path)
					end,
				},
			},
			window = {
				width = "15%",
				mappings = {
					["<Tab>"] = "next_source",
					["<S-Tab>"] = "prev_source",
					["<C-r>"] = "noop",
				},
			},
		},
	},
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-neo-tree/neo-tree.nvim",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
	{
		"s1n7ax/nvim-window-picker",
		version = "2.*",
		config = function()
			require("window-picker").setup({
				filter_rules = {
					include_current_win = false,
					autoselect_one = true,
					bo = {
						filetype = { "neo-tree", "neo-tree-popup", "notify" },
						buftype = { "terminal", "quickfix" },
					},
				},
			})
		end,
	},
}
