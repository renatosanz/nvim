return {
	"eddyekofo94/gruvbox-flat.nvim",
	priority = 1000,
	enabled = true,
	config = function()
		vim.g.gruvbox_flat_style = "hard"
		-- Example config in Lua
		vim.g.gruvbox_italic_functions = true
		vim.g.gruvbox_sidebars = { "qf", "vista_kind", "terminal", "packer" }

		-- Change the "hint" color to the "orange" color, and make the "error" color bright red
		vim.g.gruvbox_colors = { hint = "orange", error = "#ff0000" }

		-- Change the TabLineSel highlight group (used by barbar.nvim) to the "orange" color
		vim.g.gruvbox_theme = { TabLineSel = { bg = "orange" } }
		vim.cmd([[colorscheme gruvbox-flat]])
	end,
}
