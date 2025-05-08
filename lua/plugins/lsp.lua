return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          border = "none",
          icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
          },
          log_level = vim.log.levels.INFO,
          max_concurrent_installers = 6,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "lukas-reineke/lsp-format.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = require("lsp-format").on_attach

      -- Define servers and optional custom settings modules
      local servers_with_settings = {
        lua_ls = "lsp.settings.lua_ls",
        solargraph = "lsp.settings.solargraph",
        ruby_lsp = "lsp.settings.ruby_lsp",
        rubocop = "lsp.settings.rubocop",
        cssls = "lsp.settings.cssls",
        jsonls = "lsp.settings.jsonls",
        yamlls = "lsp.settings.yamlls",
      }

      -- Setup mason-lspconfig
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(servers_with_settings),
        handlers = {
          function(server_name)
            local opts = {
              capabilities = capabilities,
              on_attach = on_attach,
            }

            -- Load per-server config if available
            local has_custom_opts, custom_opts = pcall(require, servers_with_settings[server_name] or "")
            if has_custom_opts then
              opts = vim.tbl_deep_extend("force", opts, custom_opts)
            end

            -- Load project local overrides if available
            local project_local = vim.fn.getcwd() .. "/.nvim/lsp.lua"
            if vim.fn.filereadable(project_local) == 1 then
              local project_opts = dofile(project_local)
              opts = vim.tbl_deep_extend("force", opts, project_opts)
            end

            -- Finally setup the LSP server
            lspconfig[server_name].setup(opts)
          end,
        },
      })
    end,
  },
}
