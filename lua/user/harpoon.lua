local status_ok, harpoon = pcall(require, "harpoon")
if not status_ok then
  vim.notify("harpoon not found")
  return
end

harpoon.setup({})
