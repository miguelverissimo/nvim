vim.g.syntax_on = true
vim.o.background = 'dark'

vim.g.everforest_background = "medium"
local colorscheme = "everforest"

-- vim.g.material_style = "deep ocean"
-- local colorscheme = "material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
