-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local opts = { silent = true, noremap = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Save with enter
keymap("n", "<CR>", ":w<CR>", opts)

-- Copy to EOL
keymap("n", "Y", "y$", opts)

-- Commenting (uses Neovim built-in gcc/gc; <C-/> covers terminals that send it literally, <C-_> covers the rest)
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-/>", "gc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("n", "<C-_>", "gcc", { remap = true, silent = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-_>", "gc", { remap = true, silent = true, desc = "Toggle comment" })
