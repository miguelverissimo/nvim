return {
  "coder/claudecode.nvim",
  opts = {
    terminal = {
      provider = "snacks",
      split_width_percentage = 0.4,
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.scrolloff = 0
        vim.cmd.startinsert()
      end,
    })
    vim.api.nvim_create_autocmd("BufEnter", {
      pattern = "term://*",
      callback = function()
        vim.cmd.startinsert()
      end,
    })
  end,
}
