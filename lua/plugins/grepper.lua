return {
  "mhinz/vim-grepper",

  config = function()
    vim.g.grepper = {
      tools = { "rg", "ag", "git", "grep" },
      dir = "repo,filecwd",
      prompt_quote = 3,
      simple_prompt = 1,
    }
  end,
}
