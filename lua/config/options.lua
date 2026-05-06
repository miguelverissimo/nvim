-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- LazyVim disables `clipboard` when SSH_TTY is set. Re-enable it: with the
-- OSC 52 provider below, yanks reach the host clipboard via terminal escape.
vim.opt.clipboard = "unnamedplus"

-- Force OSC 52 clipboard provider. Headless TTY + tmux + SSH = no X server,
-- so xclip/xsel are useless. OSC 52 sends clipboard via terminal escape.
vim.g.clipboard = {
  name = "OSC 52",
  copy = {
    ["+"] = require("vim.ui.clipboard.osc52").copy("+"),
    ["*"] = require("vim.ui.clipboard.osc52").copy("*"),
  },
  paste = {
    ["+"] = require("vim.ui.clipboard.osc52").paste("+"),
    ["*"] = require("vim.ui.clipboard.osc52").paste("*"),
  },
}
