return {
  "saghen/blink.cmp",
  opts = {
    cmdline = {
      keymap = {
        ["<CR>"] = { "fallback" },
        ["<Tab>"] = { "show", "select_next", "select_and_accept" },
        ["<S-Tab>"] = { "show", "select_prev" },
      },
      completion = {
        list = {
          selection = { preselect = false, auto_insert = false },
        },
        menu = { auto_show = true },
      },
    },
  },
}
