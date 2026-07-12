-- Basic settings
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.wo.wrap = false
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.hlsearch = false
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.clipboard = "unnamedplus"
vim.opt.writebackup = false
vim.opt.swapfile = false
vim.opt.list = true
vim.opt.laststatus = 3
vim.opt.undofile = true
vim.opt.undolevels = 5000
vim.opt.pumheight = 10
vim.opt.scrolloff = 3
vim.opt.sidescrolloff = 3
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
-- vim.opt.background = "dark"

vim.opt.tabstop = 4 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 4 -- Size of an indent
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.softtabstop = 4 -- Number of spaces that a <Tab> counts for while editing

-- Basic mappings
local map = vim.keymap.set
map("i", "jk", "<esc>")
map("n", "<leader>ww", ":w!<CR>")
map("n", "<leader>wq", ":wq!<CR>")
map("n", "<leader>l", ":Lazy<CR>")
map("n", "<C-S>", "/")
map("n", "sp", ":sp<CR>")
map("n", "tj", ":tabprev<CR>")
map("n", "tk", ":tabnext<CR>")
map("n", "tn", ":tabnew<CR>")
map("n", "to", ":tabo<CR>")
map("n", "vs", ":vs<CR>")
map("n", "<leader>j", ":cnext<CR>", { silent = true })
map("n", "<leader>k", ":cprevious<CR>", { silent = true })
map("n", "<leader>o", ":tabonly<cr>:only<CR>", { silent = true })

map("n", "<c-h>", "<c-w>h")
map("n", "<c-l>", "<c-w>l")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")

map("n", "<leader>sv", "<C-w>v") -- Split vertically
map("n", "<leader>sh", "<C-w>s")

map("n", "<C-Up>", ":resize +2<CR>")
map("n", "<C-Down>", ":resize -2<CR>")
map("n", "<C-Left>", ":vertical resize +2<CR>")
map("n", "<C-Right>", ":vertical resize -2<CR>")

map("n", "fd", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true, desc = "Toggle terminal" })
map("n", "<C-w>", ":bd<CR>", { desc = "Close current buffer" })
map({ "n", "x", "o" }, "H", "^")
map({ "n", "x", "o" }, "L", "$")
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map("n", "Y", "y$")

-- paste without losing buffer
map("v", "p", '"_dP')

-- Yank entire buffer into default register
map("n", "yag", ":%y<CR>", { noremap = true, silent = true })

-- execute commands with enter
map("n", "<CR>", ":", { desc = "Enter command mode" })

-- search and replace
map("n", "<leader>sr", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

local opts = { buffer = 0 }
map("t", "<esc>", [[<C-\><C-n>]], opts)
map("t", "jk", [[<C-\><C-n>]], opts)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
map("v", "<leader>q", "<esc>", { desc = "Exit insert mode", remap = true })
map("n", "<leader>q", ":q!<cr>", { desc = "Exit", remap = true })

map("n", "ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Show code actions", remap = true })

-- Auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
	group = vim.api.nvim_create_augroup("EqualizeSplits", {}),
	callback = function()
		local current_tab = vim.api.nvim_get_current_tabpage()
		vim.cmd("tabdo wincmd =")
		vim.api.nvim_set_current_tabpage(current_tab)
	end,
	desc = "Resize splits with terminal window",
})
-- Global LSP mappings
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float)
