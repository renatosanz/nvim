return {
  "nvim-telescope/telescope.nvim",
  lazy = true,
  tag = "0.1.8",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    defaults = {
      -- configure to use ripgrep
      vimgrep_arguments = {
        "rg",
        "--follow",        -- Follow symbolic links
        "--hidden",        -- Search for hidden files
        "--no-heading",    -- Don't group matches by each file
        "--with-filename", -- Print the file path with the matched lines
        "--line-number",   -- Show line numbers
        "--column",        -- Show column numbers
        "--smart-case",    -- Smart case search

        -- Exclude some patterns from search
        "--glob=!**/.git/*",
        "--glob=!**/.idea/*",
        "--glob=!**/.vscode/*",
        "--glob=!**/build/*",
        "--glob=!**/dist/*",
        "--glob=!**/yarn.lock",
        "--glob=!**/package-lock.json",
      },
    },
    pickers = {
      find_files = {
        hidden = true,
        find_command = {
          "rg",
          "--files",
          "--hidden",
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/build/*",
          "--glob=!**/dist/*",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
        },
      },
    },
  },
  config = true,
  keys = {
    { "<leader><leader>", require("telescope.builtin").find_files, desc = "Telescope find files" },
    { "<leader>ff",       require("telescope.builtin").live_grep,  desc = "Telescope live grep" },
    { "<leader>fr",       require("telescope.builtin").oldfiles,   desc = "Telescope oldfiles" },
    { "<leader>fb",       require("telescope.builtin").buffers,    desc = "Telescope buffers" },
    { "<leader>fh",       require("telescope.builtin").help_tags,  desc = "Telescope help tags" },
  },
}
