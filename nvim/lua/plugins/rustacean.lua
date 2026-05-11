return {
	{
		"mrcjkb/rustaceanvim",
		version = "^8.0.5", -- Pin to v8 for Neovim 0.11 compatibility
		lazy = false, -- Still recommended to keep false for startup
		config = function()
			vim.g.rustaceanvim = {
				server = {
					-- No need to specify 'cmd' if rust-analyzer is in your PATH
					on_attach = function(client, bufnr)
						-- Keymaps can go here
					end,
					default_settings = {
						["rust-analyzer"] = {
							-- Enable the feature
							checkOnSave = true,
							-- Set the command to clippy
							check = {
								command = "clippy",
							},
						},
					},
					-- Ensure Blink works with Rust
					capabilities = function()
						local ok, blink = pcall(require, "blink")
						return ok and blink.get_lsp_capabilities() or {}
					end,
				},
			}
		end,
	},
}
