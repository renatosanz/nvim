return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup({ ensure_installed = { "lua_ls", "prettier", "black", "tsserver" } })

		-- After setting up mason-lspconfig you may set up servers via lspconfig
		require("lspconfig").lua_ls.setup({})
		require("lspconfig").tsserver.setup({})
		require("lspconfig").pyright.setup({})
	end,
}
