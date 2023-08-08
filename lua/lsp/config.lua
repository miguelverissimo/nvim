local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.setup {
  automatic_installation = true,
  ensure_installed = {
    "lua_ls",
    "solargraph",
    "jsonls",
    "bashls",
    "cssls",
    "dockerls",
    "html",
    "sqlls",
    "tsserver",
    "yamlls",
    "emmet_ls",
  }
}

local defaults = {
  on_attach = require("lsp.handlers").on_attach,
  capabilities = require("lsp.handlers").capabilities,
}

local lspconfig = require("lspconfig")

local luadev_ok, luadev = pcall(require, "lua-dev")
if luadev_ok then
  lspconfig.lua_ls.setup(luadev.setup(vim.tbl_deep_extend("force", require("lsp.settings.lua_ls"), defaults)))
else
  lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", require("lsp.settings.lua_ls"), defaults))
end

--[[ local servers = lsp_installer.get_installed_servers() ]]
lspconfig.solargraph.setup(vim.tbl_deep_extend("force", require("lsp.settings.solargraph"), defaults))
lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("lsp.settings.jsonls"), defaults))
lspconfig.bashls.setup(defaults)
lspconfig.cssls.setup(defaults)
lspconfig.dockerls.setup(defaults)
lspconfig.html.setup(defaults)
lspconfig.sqlls.setup(defaults)
lspconfig.tsserver.setup(defaults)
lspconfig.yamlls.setup(defaults)
lspconfig.rust_analyzer.setup(vim.tbl_deep_extend("force", require("lsp.settings.rust_analyzer"), defaults))
lspconfig.elixirls.setup {
  cmd = { "$ELIXIR_LS_HOME/bin/elixir-ls" },
  on_attach = on_attach,
  capabilities = capabilities
}

--[[ Emmet ]]
local configs = require 'lspconfig.configs'
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

if not configs.ls_emmet then
  configs.ls_emmet = {
    default_config = {
      cmd = { 'ls_emmet', '--stdio' },
      filetypes = {
        'html',
        'css',
        'scss',
        'javascriptreact',
        'typescriptreact',
        'haml',
        'xml',
        'xsl',
        'pug',
        'slim',
        'sass',
        'stylus',
        'less',
        'sss',
        'hbs',
        'handlebars',
      },
      root_dir = function(fname)
        return vim.loop.cwd()
      end,
      settings = {},
    },
  }
end

lspconfig.ls_emmet.setup { capabilities = capabilities }
--[[ /Emmet ]]
