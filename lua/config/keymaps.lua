local map = vim.keymap.set
-- edit my config
map("n", "<leader>n", ":edit ~/.config/nvim<cr>", { desc = "Edit nvim config", remap = true })
map("n", "e", "b", { remap = true })
map("n", "w", "E", { remap = true })
map("v", "e", "b", { remap = true })
map("v", "w", "E", { remap = true })
map("n", "<leader>ww", ":wa<CR>", { desc = "Save file", remap = true })
map("n", "<leader>wq", ":x<CR>", { desc = "Save file & exit", remap = true })
map("i", "jk", "<esc>", { desc = "Exit insert mode", remap = true })
map("v", "q", "<esc>", { desc = "Exit insert mode", remap = true })
map("n", "q", ":q!<cr>", { desc = "Exit", remap = true })
map("x", "p", '"_dP')
map("n", "<leader>ds", "/", { desc = "Search word", remap = true })
-- lazy
map("n", "<leader>l", ":Lazy<cr>", { desc = "Open Lazy", remap = true })
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- move lines
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("v", "L", "$")
map("v", "H", "0")
map("n", "L", "$")
map("n", "H", "0")
--search line in the middle
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

local opts = { buffer = 0 }
map("t", "<esc>", [[<C-\><C-n>]], opts)
map("t", "jk", [[<C-\><C-n>]], opts)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)

map({ "t" }, "<leader>+", require("term").new, { silent = true })
map({ "n", "t" }, "fd", require("term").toggle, { silent = true })
map({ "t" }, "{", require("term").next, { silent = true })
map({ "t" }, "}", require("term").prev, { silent = true })
