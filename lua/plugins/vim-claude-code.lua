return {
  "rishi-opensource/vim-claude-code",
  init = function()
    vim.g.claude_code_position = "right"
    vim.g.claude_code_split_ratio = 0.4
    vim.g.claude_code_use_git_root = 1
    vim.g.claude_code_map_keys = 1
    vim.g.claude_code_refresh_enable = 1
  end,
}
