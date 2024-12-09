return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	verison = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	keys = {
		{ "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
		{ "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
	},
	opts = {
		options = {},
	},
}
