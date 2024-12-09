local map = vim.keymap.set
map("n", "<leader>l", ":Lazy<cr>", { desc = "Open Lazy", remap = true })
map("n", "<leader>m", ":Mason<cr>", { desc = "Open Mason", remap = true })
map("n", "e", "b", { remap = true })
map("n", "<leader>ww", ":w<CR>", { desc = "Save file", remap = true })
map("n", "<leader>wq", ":x<CR>", { desc = "Save file & exit", remap = true })
map("i", "jk", "<esc>", { desc = "Exit insert mode", remap = true })
map("n", "q", ":q!<cr>", { desc = "Exit", remap = true })
map("n", "<leader>ds", "/", { desc = "Search word", remap = true })

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader><leader>", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>ff", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })