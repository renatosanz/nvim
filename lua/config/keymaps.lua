local map = vim.keymap.set
-- edit my config
map("n", "<leader>n", ":edit ~/.config/nvim<cr>", { desc = "Edit nvim config", remap = true })
map("n", "<leader>ww", function()
	if next(vim.fn.getbufinfo({ buflisted = 1, modified = 1 })) ~= nil then
		vim.cmd("silent! wa") -- Only save if there are modified buffers
	end
end, { desc = "Save file", remap = true })
map("n", "<leader>wq", ":x<CR>", { desc = "Save file & exit", remap = true })
map("i", "jk", "<esc>", { desc = "Exit insert mode", remap = true })
map("v", "<leader>q", "<esc>", { desc = "Exit insert mode", remap = true })
map("n", "<leader>q", ":q!<cr>", { desc = "Exit", remap = true })
map("x", "p", '"_dP')
map("n", "<leader>ds", "/", { desc = "Search word", remap = true })
-- lazy
map("n", "<leader>l", ":Lazy<cr>", { desc = "Open Lazy", remap = true })
-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
map("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- nnoremap <silent> ca <cmd>lua vim.lsp.buf.code_action()<CR>
map("n", "ca", function()
	vim.lsp.buf.code_action()
end, { desc = "Show code actions", remap = true })

-- Disable arrows movement
-- move lines

map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

map({ "v", "n" }, "j", "gj")
map({ "v", "n" }, "k", "gk")

map("v", "L", "$")
map("v", "H", "0")
map("n", "L", "$")
map("n", "H", "0")

local opts = { buffer = 0 }
map("t", "<esc>", [[<C-\><C-n>]], opts)
map("t", "jk", [[<C-\><C-n>]], opts)
map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
map("i", "<Up>", "<Nop>", { noremap = true, silent = true })
map("i", "<Down>", "<Nop>", { noremap = true, silent = true })
map("i", "<Left>", "<Nop>", { noremap = true, silent = true })
map("i", "<Right>", "<Nop>", { noremap = true, silent = true })

-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = "yes"

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
	desc = "LSP actions",
	callback = function(event)
		local opts = { buffer = event.buf }

		vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
		vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
		vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
		vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
		vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
		vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
		vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
		vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
		vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
	end,
})
