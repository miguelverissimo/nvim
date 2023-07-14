local status_ok, lualine = pcall(require, "lualine")
if not status_ok then return end

local filename = {
  "filename",
  path = 1,
}

lualine.setup({
  options = {
    icons_enabled = true,
    --[[ theme = 'oceanic-material', ]]
    component_separators = { left = "\\", right = "/" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "NvimTree", "alpha", "Ranger" },
    globalstatus = false,
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { 'branch' },
    lualine_c = { 'diff', require("lsp-status").status, require("pomodoro").statusline,
      require('auto-session.lib').current_session_name },
    lualine_x = {
      {
        require("noice").api.statusline.mode.get,
        cond = require("noice").api.statusline.mode.has,
        color = { fg = "#ff9e64" },
      },
      filename,
      "filetype"
    },
    lualine_y = { "progress" },
    lualine_z = { "location" }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { "filename" },
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
})
