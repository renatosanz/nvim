local map = vim.keymap.set

map("i", "jk", "<Esc>")
map("n", "bd", ":bd<cr>")
map("n", "ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<f2>", "<cmd>lua vim.lsp.buf.rename()<CR>")
map("n", "<leader>ll", "$")
map("n", "<leader>hh", "0")

map({ "n", "t" }, "q", ":q!<CR>")
map("n", "<leader>w", ":w<CR>")
map("n", "<leader>wq", ":wq<CR>")
map("n", "<leader>nv", ":vsplit ~/.config/nvim/init.lua<cr>", {})
map("n", "<leader>l", ":Lazy<cr>", {})
map("n", "<leader>m", ":Mason<cr>", {})

map("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
map("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
map("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
map("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

map("n", "fh", "<C-w>h")
map("n", "fj", "<C-w>j")
map("n", "fk", "<C-w>k")
map("n", "fl", "<C-w>l")

map("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
map("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

map("t", "fj", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

vim.cmd([[
  au FocusLost * :wa
]])
