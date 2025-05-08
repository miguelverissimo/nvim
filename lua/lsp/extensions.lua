local M = {}

-- Called during on_attach
function M.on_attach(client, bufnr)
  -- Example: Attach navic only for certain servers
  if client.server_capabilities.documentSymbolProvider then
    local ok, navic = pcall(require, "nvim-navic")
    if ok then
      navic.attach(client, bufnr)
    end
  end
end

return M
