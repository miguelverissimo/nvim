local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

lsp_installer.setup {
  automatic_installation = true,
  ensure_installed = {
    "sumneko_lua",
    "solargraph",
    "jsonls",
    "bashls",
    "cssls",
    "dockerls",
    "html",
    "sqlls",
    "tsserver",
    "yamlls",
  }
}

local defaults = {
  on_attach = require("lsp.handlers").on_attach,
  capabilities = require("lsp.handlers").capabilities,
}

local lspconfig = require("lspconfig")

local luadev_ok, luadev = pcall(require, "lua-dev")
if luadev_ok then
  lspconfig.sumneko_lua.setup(luadev.setup(vim.tbl_deep_extend("force", require("lsp.settings.sumneko_lua"), defaults)))
else
  lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", require("lsp.settings.sumneko_lua"), defaults))
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
