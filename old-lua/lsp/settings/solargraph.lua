return {
  settings = {
    Solargraph = {
      cmd = { os.getenv("HOME") .. "/.asdf/shims/solargraph", 'stdio' },
      root_dir = require("lspconfig").util.root_pattern("Gemfile", ".git", "."),
      init_options = { formatting = true },
      filetypes = { 'ruby' },
      settings = {
        solargraph = {
          autoformat = true,
          completion = true,
          diagnostics = true,
          folding = true,
          references = true,
          rename = true,
          symbols = true
        },
      },
    },
  },
}
