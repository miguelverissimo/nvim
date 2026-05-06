return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          hidden = true,
          ignored = true,
        },
        files = {
          hidden = true,
          ignored = true,
        },
      },
    },
  },
  keys = {
    {
      "|",
      function()
        Snacks.explorer({ cwd = vim.fn.getcwd(), follow_file = true })
      end,
      desc = "Explorer (cwd, reveal current file)",
    },
    {
      "\\",
      function()
        Snacks.explorer({ cwd = vim.fn.getcwd(), follow_file = false })
      end,
      desc = "Explorer (cwd)",
    },
  },
}
