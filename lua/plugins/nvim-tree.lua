return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for file icons
  keys = {
    {
      "<leader>e",
      ":NvimTreeToggle<CR>",
      desc = "Toggle file explorer (NvimTree)",
      noremap = true,
      silent = true,
      mode = { "n", }
    }
  },

  config = function()
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1
    vim.opt.termguicolors = true
    require("nvim-tree").setup({
      sort_by = "case_sensitive",
      view = {
        width = 30,
      },
      renderer = {
        group_empty = true,
      },
      filters = {
        dotfiles = true,
      },
    })
  end,
}
