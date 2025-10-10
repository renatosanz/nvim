return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- Optional, for file icons
  config = function()
    -- Disable netrw, the default file explorer
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    -- Enable termguicolors for custom highlights
    vim.opt.termguicolors = true

    -- Setup nvim-tree
    require("nvim-tree").setup({
      -- Your custom options can go here
      -- For example:
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

    -- Define the keybinding to toggle the file explorer
    local keymap = vim.keymap
    keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", {
      desc = "Toggle file explorer (NvimTree)",
      noremap = true,
      silent = true,
    })
  end,
}
