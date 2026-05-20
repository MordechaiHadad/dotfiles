return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			{ "williamboman/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function(_, opts)
			require("mason-lspconfig").setup(opts)

			vim.diagnostic.config({
				signs = false,
				update_in_insert = true,
				severity_sort = true,
				float = { border = "single", source = true },
			})

			local ok, blink = pcall(require, "blink")
			if ok then
				vim.lsp.config("*", {
					capabilities = blink.get_lsp_capabilities(),
				})
			end

			vim.schedule(function()
				if vim.api.nvim_buf_is_valid(0) then
					vim.cmd("filetype detect")
				end
			end)
		end,
		opts = {
			automatic_enable = {
				exclude = { "rust_analyzer" },
			},
			ensure_installed = { "lua_ls", "svelte", "csharp_ls", "ruff", "vtsls", "tailwindcss" },
		},
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy",
		priority = 1000,
		config = function()
			require("tiny-inline-diagnostic").setup()
			vim.diagnostic.config({ virtual_text = false }) -- Disable Neovim's default virtual text diagnostics
		end,
	},
}
