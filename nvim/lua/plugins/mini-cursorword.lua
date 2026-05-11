return {
	"echasnovski/mini.cursorword",
	version = "*",
	config = function()
		require("mini.cursorword").setup({
			-- delay in milliseconds before highlighting
			delay = 100,
		})
	end,
}
