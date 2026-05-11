return {
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets", "folke/lazydev.nvim" },
		version = "1.*",
		opts = {
			keymap = { preset = "enter" },
			appearance = {
				nerd_font_variant = "mono",
			},
			completion = { documentation = { auto_show = true } },
			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						-- make lazydev completions top priority (see `:h blink.cmp`)
						score_offset = 100,
					},
				},
			},
			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
	{
		"saghen/blink.pairs",
		version = "*", -- (recommended) only required with prebuilt binaries

		-- download prebuilt binaries from github releases
		dependencies = "saghen/blink.download",
		-- OR build from source, requires nightly:
		-- https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		--- @module 'blink.pairs'
		--- @type blink.pairs.Config
		opts = {
			mappings = {
				-- you can call require("blink.pairs.mappings").enable()
				-- and require("blink.pairs.mappings").disable()
				-- to enable/disable mappings at runtime
				enabled = true,
				cmdline = true,
				-- or disable with `vim.g.pairs = false` (global) and `vim.b.pairs = false` (per-buffer)
				-- and/or with `vim.g.blink_pairs = false` and `vim.b.blink_pairs = false`
				disabled_filetypes = {},
				-- see the defaults:
				-- https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L14
				pairs = {},
			},
			highlights = {
				enabled = false,
				-- requires require('vim._extui').enable({}), otherwise has no effect
				-- cmdline = true,
				-- groups = {
				--   'BlinkPairsOrange',
				--   'BlinkPairsPurple',
				--   'BlinkPairsBlue',
				-- },
				-- unmatched_group = 'BlinkPairsUnmatched',
				--
				-- -- highlights matching pairs under the cursor
				-- matchparen = {
				--   enabled = true,
				--   -- known issue where typing won't update matchparen highlight, disabled by default
				--   cmdline = false,
				--   -- also include pairs not on top of the cursor, but surrounding the cursor
				--   include_surrounding = false,
				--   group = 'BlinkPairsMatchParen',
				--   priority = 250,
				-- },
			},
			debug = false,
		},
	},
}
