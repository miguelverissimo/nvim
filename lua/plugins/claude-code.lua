return {
  "greggh/claude-code.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("claude-code").setup({
      window = {
        position = "vertical botright",
        split_ratio = 0.4,
      },
      git = {
        use_git_root = true,
      },
      keymaps = {
        toggle = {
          normal = "<leader>cc",
          terminal = "<leader>cc",
          variants = {
            continue = "<leader>cC",
            verbose = "<leader>cV",
          },
        },
        window_navigation = false,
        scrolling = false,
      },
    })
  end,
}
