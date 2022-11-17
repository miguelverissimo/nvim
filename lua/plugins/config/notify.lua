local status_ok, notify = pcall(require, "notify")
if not status_ok then return end

vim.notify("this shit is here")
notify.setup({
  background_colour = "#000000",
  stages = "slide",
  timeout = 5000,
  background_colour = "#999999",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
