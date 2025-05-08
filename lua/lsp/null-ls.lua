local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then return end

local sources = {
  null_ls.builtins.formatting.mix,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.rubocop,

  null_ls.builtins.diagnostics.rubocop,
}

null_ls.setup {
  sources = sources,
  default_timeout = 7500,
}
