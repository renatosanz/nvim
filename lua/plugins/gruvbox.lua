return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	enabled = true,
	config = function()
		require("gruvbox").setup({
			transparent_mode = true,
		})
		vim.o.background = "dark"
		vim.cmd([[colorscheme gruvbox]])
	end,
}
