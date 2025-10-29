return {
  "williamboman/mason.nvim",
  event = "InsertEnter",
  lazy = true,
  config = function()
    require("mason").setup()
  end,
  keys = {
    { "<leader>m", ":Mason<cr>", desc = "Open Mason", remap = true },
  },
}
