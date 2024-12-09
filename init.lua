require("config.lazy")
require("config.keymaps")
require("config.config")

vim.o.background = "dark"
vim.opt.termguicolors = true

vim.cmd([[
hi BufferLineFill guibg='#1D2021'
hi BufferLineSeparator guibg='#1D2021'
hi BufferLineSeparatorVisible guibg='#1D2021'
set termguicolors
]])

vim.api.nvim_set_hl(0, "StatusLine", { reverse = false })
vim.api.nvim_set_hl(0, "StatusLineNC", { reverse = false })
