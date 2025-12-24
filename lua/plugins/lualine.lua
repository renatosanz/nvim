return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = function()
		local lualine = require("lualine")

		-- Paleta de colores de Gruvbox
		local colors = {
			dark0_hard = "#1d2021",
			dark0 = "#282828",
			dark0_soft = "#32302f",
			dark1 = "#3c3836",
			dark2 = "#504945",
			dark3 = "#665c54",
			dark4 = "#7c6f64",
			gray = "#928374",
			light0_hard = "#f9f5d7",
			light0 = "#fbf1c7",
			light0_soft = "#f2e5bc",
			light1 = "#ebdbb2",
			light2 = "#d5c4a1",
			light3 = "#bdae93",
			light4 = "#a89984",
			bright_red = "#fb4934",
			bright_green = "#b8bb26",
			bright_yellow = "#fabd2f",
			bright_blue = "#83a598",
			bright_purple = "#d3869b",
			bright_aqua = "#8ec07c",
			bright_orange = "#fe8019",
			neutral_red = "#cc241d",
			neutral_green = "#98971a",
			neutral_yellow = "#d79921",
			neutral_blue = "#458588",
			neutral_purple = "#b16286",
			neutral_aqua = "#689d6a",
			neutral_orange = "#d65d0e",
		}

		-- Configuración principal
		local config = {
			options = {
				theme = {
					normal = {
						a = { fg = colors.dark0, bg = colors.bright_blue },
						b = { fg = colors.light1, bg = colors.dark1 },
						c = { fg = colors.light1, bg = colors.dark0 },
					},
					insert = {
						a = { fg = colors.dark0, bg = colors.bright_green },
						b = { fg = colors.light1, bg = colors.dark1 },
						c = { fg = colors.light1, bg = colors.dark0 },
					},
					visual = {
						a = { fg = colors.dark0, bg = colors.bright_purple },
						b = { fg = colors.light1, bg = colors.dark1 },
						c = { fg = colors.light1, bg = colors.dark0 },
					},
					replace = {
						a = { fg = colors.dark0, bg = colors.bright_red },
						b = { fg = colors.light1, bg = colors.dark1 },
						c = { fg = colors.light1, bg = colors.dark0 },
					},
					command = {
						a = { fg = colors.dark0, bg = colors.bright_yellow },
						b = { fg = colors.light1, bg = colors.dark1 },
						c = { fg = colors.light1, bg = colors.dark0 },
					},
					inactive = {
						a = { fg = colors.gray, bg = colors.dark0 },
						b = { fg = colors.gray, bg = colors.dark0 },
						c = { fg = colors.gray, bg = colors.dark0 },
					},
				},
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = false,
				refresh = {
					statusline = 1000,
					tabline = 1000,
					winbar = 1000,
				},
			},
			sections = {
				lualine_a = {
					{
						"mode",
						icon = " ***",
						separator = { right = "" },
						padding = { left = 0, right = 1 },
					},
				},
				lualine_b = {
					{
						"branch",
						icon = "",
						color = { fg = colors.bright_purple, gui = "bold" },
					},
					{
						"diff",
						symbols = {
							added = " ",
							modified = " ",
							removed = " ",
						},
						diff_color = {
							added = { fg = colors.bright_green },
							modified = { fg = colors.bright_yellow },
							removed = { fg = colors.bright_red },
						},
						color = { fg = colors.light1 },
					},
				},
				lualine_c = {
					{
						"filename",
						path = 1,
						symbols = {
							modified = " ●",
							readonly = " ",
							unnamed = " ",
							newfile = " ",
						},
						color = { fg = colors.light1, gui = "bold" },
					},
					{
						"diagnostics",
						sources = { "nvim_diagnostic" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
							hint = " ",
						},
						diagnostics_color = {
							error = { fg = colors.bright_red },
							warn = { fg = colors.bright_yellow },
							info = { fg = colors.bright_blue },
							hint = { fg = colors.bright_aqua },
						},
					},
				},
				lualine_x = {
					{
						function()
							local buf_ft = vim.bo.filetype
							local clients = vim.lsp.get_clients()
							if next(clients) == nil then
								return "No LSP"
							end

							for _, client in ipairs(clients) do
								local filetypes = client.config.filetypes
								if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
									return client.name
								end
							end
							return "No LSP"
						end,
						icon = "",
						color = { fg = colors.bright_orange, gui = "bold" },
					},
					{
						"filetype",
						icon_only = true,
						colored = true,
						padding = { left = 1 },
					},
					{
						"fileformat",
						symbols = {
							unix = "",
							dos = "",
							mac = "",
						},
						color = { fg = colors.bright_green, gui = "bold" },
					},
					{
						"encoding",
						fmt = string.upper,
						color = { fg = colors.bright_aqua, gui = "bold" },
					},
				},
				lualine_y = {
					{
						"progress",
						color = { fg = colors.light1, gui = "bold" },
					},
					{
						"location",
						color = { fg = colors.bright_blue, gui = "bold" },
					},
				},
				lualine_z = {
					{
						function()
							return " " .. os.date("%H:%M")
						end,
						color = { fg = colors.dark0, bg = colors.bright_blue },
						separator = { left = "" },
						padding = { left = 1, right = 0 },
					},
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		}

		lualine.setup(config)
	end,
}
