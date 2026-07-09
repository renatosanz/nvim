require("basics")

vim.o.background = "dark"
vim.opt.termguicolors = true

vim.cmd([[
hi BufferLineFill guibg='#1D2021'
hi BufferLineSeparator guibg='#1D2021'
hi BufferLineSeparatorVisible guibg='#1D2021'
set termguicolors
]])

vim.diagnostic.config({
	virtual_text = {
		spacing = 4,
		source = "if_many", -- Shows plugin/LSP name if there are multiple sources
		prefix = "●", -- Change the prefix symbol inline
	},
	severity_sort = true, -- Puts higher priority errors first
	underline = true, -- Underline the exact broken code
	signs = true, -- Show symbols in the gutter (left column)
})

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- For comments
local get_option = vim.filetype.get_option
vim.filetype.get_option = function(filetype, option)
	return option == "commentstring" and require("ts_context_commentstring.internal").calculate_commentstring()
		or get_option(filetype, option)
end
