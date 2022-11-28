local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local sources = {
  null_ls.builtins.code_actions.eslint,

  null_ls.builtins.formatting.erb_lint,
  null_ls.builtins.formatting.eslint,
  null_ls.builtins.formatting.mix,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.rubocop,
  null_ls.builtins.formatting.rustfmt,
  null_ls.builtins.formatting.stylelint,
  null_ls.builtins.formatting.tidy,
  null_ls.builtins.formatting.trim_whitespace,

  null_ls.builtins.diagnostics.credo,
  null_ls.builtins.diagnostics.erb_lint,
  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.diagnostics.rubocop,
  null_ls.builtins.diagnostics.stylelint,
  null_ls.builtins.diagnostics.tidy,
  null_ls.builtins.diagnostics.tsc,
}

null_ls.setup {
  sources = sources,
  default_timeout = 7500,
}
