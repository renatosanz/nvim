return {
	{
		"kessejones/term.nvim",
		version = "*",
		keys = {
			{
				"n",
				"fd",
				function()
					require("term").toggle()
				end,
				desc = "Toggle terminal",
			},
		},
		config = function()
			require("term").setup({
				shell = vim.o.shell,
				width = 0.9,
				height = 0.9,
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
