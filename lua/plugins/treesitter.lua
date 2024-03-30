return {
	"nvim-treesitter/nvim-treesitter",
	event = { "VeryLazy" },
	dependencies = {
		{
			"nvim-treesitter/nvim-treesitter-textobjects",
			cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
			keys = {
				{ "<c-space>", desc = "Increment Selection" },
				{ "<bs>", desc = "Decrement Selection", mode = "x" },
			},
		},
	},
}
