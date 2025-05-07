local status_ok, notify = pcall(require, "notify")
if not status_ok then return end

notify.setup({
  stages = "slide",
  timeout = 5000,
  background_colour = "#000000",
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
