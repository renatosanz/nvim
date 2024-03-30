return {
  "neovim/nvim-lspconfig",
  dependencies = {
    {"williamboman/mason.nvim",config=true},
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason = require("mason")

    require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

    lspconfig.rust_analyzer.setup({})
    lspconfig.lua_ls.setup({})

  end,
}
