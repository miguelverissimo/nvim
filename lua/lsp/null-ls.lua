local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

-- code action sources
local code_actions = null_ls.builtins.code_actions

-- diagnostic sources
local diagnostics = null_ls.builtins.diagnostics

-- formatting sources
local formatting = null_ls.builtins.formatting

-- hover sources
--[[ local hover = null_ls.builtins.hover ]]

-- completion sources
--[[ local completion = null_ls.builtins.completion ]]

local sources = {
  code_actions.eslint,
  code_actions.luasnip,

  formatting.rubocop,
  formatting.erb_lint,
  formatting.eslint,
  formatting.stylelua,
  formatting.mix,
  formatting.prettier,
  formatting.rustfmt,
  formatting.stylelint,
  formatting.tidy,
  formatting.trim_whitespace,

  diagnostics.rubocop,
  diagnostics.erb_lint,
  diagnostics.eslint,
  diagnostics.credo,
  diagnostics.spectral,
  diagnostics.stylelint,
  diagnostics.tidy,
  diagnostics.tsc,
}

null_ls.setup({ sources = sources })
