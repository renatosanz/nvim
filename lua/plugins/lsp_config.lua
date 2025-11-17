return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities.textDocument.completion.completionItem.snippetSupport = true

		require("mason-lspconfig").setup({
			ensure_installed = {
				"lua_ls",
				"prettier",
				"clang-format",
				"biome",
				"vtsls",
				"pyright",
				"stylua",
				"pgformatter",
				"postgres-language-server",
			},
			handlers = {
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
			},
		})
	end,
}
