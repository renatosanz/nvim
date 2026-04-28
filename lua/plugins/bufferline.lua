return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				numbers = "ordinal", -- Shows the number for Alt + <num> jumping
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "left",
						separator = true,
					},
				},
			},
		})

		local map = vim.keymap.set

		map("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
		map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })

		for i = 1, 9 do
			map("n", string.format("<A-%d>", i), function()
				require("bufferline").go_to(i, true)
			end, { desc = "Go to Buffer " .. i })
		end
	end,
}
