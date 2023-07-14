local status_ok, auto_session = pcall(require, "auto-session")
if not status_ok then return end

vim.o.sessionoptions = "buffers,curdir,folds,tabpages,winsize,winpos"

auto_session.setup({
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  cwd_change_handling = {
    post_cwd_changed_hook = function() -- example refreshing the lualine status line _after_ the cwd changes
      require("lualine").refresh()     -- refresh lualine so the new session name is displayed in the status bar
    end,
  },
})
