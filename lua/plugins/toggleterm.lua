return {
  {
    "kessejones/term.nvim",
    version = "*",
    keys = {
      {
        "<leader>fd",
        function()
          if next(vim.fn.getbufinfo({ buflisted = 1, modified = 1 })) ~= nil then
            vim.cmd("silent! wa")
          end
          require("term").toggle()
        end,
        mode = { "n", "t" },
        desc = "Toggle terminal",
      },
      { "<leader>++", function() require("term").new() end,  mode = { "t" }, desc = "New terminal tab" },
      { "}",          function() require("term").next() end, mode = { "t" }, desc = "Next terminal tab" },
      { "{",          function() require("term").prev() end, mode = { "t" }, desc = "Prev terminal tab" },
    },
    config = function()
      require("term").setup({
        shell = vim.o.shell,
        width = 1,
        height = 1,
        position = "center",
        border = nil,
        title = {
          align = "center", -- left, center or right
        },
      })
    end,
  },
}
