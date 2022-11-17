--[[ -- local status_ok, mason = pcall(require, "mason") ]]
--[[ -- if not status_ok then return end ]]
--[[ -- ]]
--[[ -- mason.setup() ]]
--[[ -- ]]
--[[ -- require("mason-lspconfig").setup({ ]]
--[[ --   ensure_installed = { ]]
--[[ --     "bashls", ]]
--[[ --     "cssls", ]]
--[[ --     "dockerls", ]]
--[[ --     "html", ]]
--[[ --     "jsonls", ]]
--[[ --     "lemminx", ]]
--[[ --     "solargraph", ]]
--[[ --     "sqlls", ]]
--[[ --     "sumneko_lua", ]]
--[[ --     "tsserver", ]]
--[[ --     "yamlls", ]]
--[[ --   }, ]]
--[[ -- }) ]]
--[[]]
--[[ local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer") ]]
--[[ if not status_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ lsp_installer.setup { ]]
--[[   automatic_installation = true, ]]
--[[   ensure_installed = { ]]
--[[     "bashls", ]]
--[[     "cssls", ]]
--[[     "dockerls", ]]
--[[     "jsonls", ]]
--[[     "lemminx", ]]
--[[     "solargraph", ]]
--[[     "sumneko_lua", ]]
--[[     "tsserver", ]]
--[[     "yamlls", ]]
--[[   } ]]
--[[ } ]]
--[[]]
--[[ local defaults = { ]]
--[[   on_attach = require("lsp.handlers").on_attach, ]]
--[[   capabilities = require("lsp.handlers").capabilities, ]]
--[[ } ]]
--[[]]
--[[ local lspconfig = require("lspconfig") ]]
--[[]]
--[[ local luadev_ok, luadev = pcall(require, "lua-dev") ]]
--[[ if luadev_ok then ]]
--[[   lspconfig.sumneko_lua.setup(luadev.setup(vim.tbl_deep_extend("force", require("lsp.settings.sumneko_lua"), defaults))) ]]
--[[ else ]]
--[[   lspconfig.sumneko_lua.setup(vim.tbl_deep_extend("force", require("lsp.settings.sumneko_lua"), defaults)) ]]
--[[ end ]]
--[[]]
--[[ local servers = lsp_installer.get_installed_servers() ]]
--[[]]
--[[]]
--[[ lspconfig.solargraph.setup(vim.tbl_deep_extend("force", require("lsp.settings.solargraph"), defaults)) ]]
--[[ lspconfig.jsonls.setup(vim.tbl_deep_extend("force", require("lsp.settings.jsonls"), defaults)) ]]
--[[ lspconfig.bashls.setup(defaults) ]]
--[[ lspconfig.cssls.setup(defaults) ]]
--[[ lspconfig.dockerls.setup(defaults) ]]
--[[ lspconfig.html.setup(defaults) ]]
--[[ lspconfig.lemminx.setup(defaults) ]]
--[[ lspconfig.sqlls.setup(defaults) ]]
--[[ lspconfig.tsserver.setup(defaults) ]]
--[[ lspconfig.yamlls.setup(defaults) ]]
--[[]]
--[[]]
--[[]]
--[[]]
local M = {}
M.__index = M

local lspconfig = require('lspconfig')
local lsp_installer = require("nvim-lsp-installer")

-- {{ lsp_installer }} --
-- servers are installed to $XDG_DATA_HOME/nvim/lsp_servers
-- :LspInstallInfo
-- :LspInstall <lsp server name>
-- :LspInstallLog
-- :LspInfo
function M.init()
  lsp_installer.setup({
    automatic_installation = true,
    ensure_installed = { 'solargraph', 'sorbet' },
  })

  local servers = lsp_installer.get_installed_servers()
  for _, server in ipairs(servers) do
    local attach_noty = function(_, bufnr)
      print("Buffer " .. bufnr .. " attached to " .. server.name)
    end

    if server.name == 'sumneko_lua' then
      lspconfig.sumneko_lua.setup({
        on_attach = attach_noty,
        settings = {
          Lua = {
            diagnostics = {
              -- Silence the `undefined global 'vim'` warning sumneko gives
              globals = { 'vim' }
            }
          }
        }
      })
    else
      lspconfig[server.name].setup({
        on_attach = attach_noty,
      })
    end
  end
end

return M
