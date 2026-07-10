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
	virtual_text = true,
	signs = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
})

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰃤",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "",
			[vim.diagnostic.severity.INFO] = "󰅪",
		},
	},
})

vim.api.nvim_set_hl(0, "DiagnosticError", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { bg = "NONE" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { bg = "NONE" })

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
