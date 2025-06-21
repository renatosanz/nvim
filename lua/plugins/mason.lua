return {
	"williamboman/mason.nvim",
	lazy = true,
	config = function()
		require("mason").setup()
	end,
	keys = {
		{ "<leader>m", ":Mason<cr>", desc = "Open Mason", remap = true },
	},
}
