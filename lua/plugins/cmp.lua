return {
	"hrsh7th/nvim-cmp", -- Autocompletion plugin,
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
		"L3MON4D3/LuaSnip",
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local luasnip = require("luasnip")
		-- Setup language servers.
		local lspconfig = require("lspconfig")
		local servers = {
			"lua_ls",
			"ts_ls",
		}
		for _, lsp in ipairs(servers) do
			lspconfig[lsp].setup({
				-- on_attach = my_custom_on_attach,
				capabilities = capabilities,
			})
		end

		local cmp = require("cmp")

		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "buffer" },
			},

			mapping = cmp.mapping.preset.insert({
				["<C-u>"] = cmp.mapping.scroll_docs(-4), -- Up
				["<C-d>"] = cmp.mapping.scroll_docs(4), -- Down
				["<C-j>"] = cmp.mapping.select_next_item(),
				["<C-k>"] = cmp.mapping.select_prev_item(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
		})
	end,
}
