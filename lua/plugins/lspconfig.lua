return {
  {
    "williamboman/mason.nvim",

    config = function()
      require("mason").setup()
    end,
  },
  {
    "neovim/nvim-lspconfig",

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.enable("ruby_lsp")
      vim.lsp.config("ruby_lsp", {
        capabilities = capabilities,
        on_attach = require("lsp-format").on_attach,
      })

      vim.lsp.enable("rubocop")
      vim.lsp.config("rubocop", {
        capabilities = capabilities,
        on_attach = require("lsp-format").on_attach,
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
        on_attach = require("lsp-format").on_attach,
      })
    end,
  },
}
