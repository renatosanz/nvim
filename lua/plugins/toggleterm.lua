return {
	{
		"kessejones/term.nvim",
		version = "*",
		config = function()
			require("term").setup({
				shell = vim.o.shell,
				width = 0.8,
				height = 0.5,
				anchor = "NW",
				position = "center",
				title = {
					align = "center", -- left, center or right
				},
				border = {
					chars = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
					hl = "TermBorder",
				},
			})
		end,
	},
}
