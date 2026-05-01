--
local opts = { silent = true, noremap = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Merge two tables
local function mergeTables(t1, t2)
  local merged = {}

  for k, v in pairs(t1) do
    merged[k] = v
  end

  for k, v in pairs(t2) do
    merged[k] = v
  end

  return merged
end

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Save with enter
keymap("n", "<CR>", ":w<CR>", opts)

-- Paste over selected text
keymap("v", "p", '"_dP', opts)

-- Better Indentation
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Insert lines above/below without leaving normal mode
keymap("n", "oo", "o<Esc>k", opts)
keymap("n", "OO", "O<Esc>j", opts)

-- ESC to clear search
keymap("n", "<Esc>", ":noh<CR>", opts)

-- Remove highlighting
keymap("n", "<Esc><Esc>", ":<C-u>nohlsearch<CR>", opts)

-- Navigate quicklist items
keymap("n", "gn", "<cmd>cnext<CR>", opts)
keymap("n", "gp", "<cmd>cprev<CR>", opts)

-- Navigate tabs
keymap("n", "tl", ":tabnext<CR>", opts)
keymap("n", "th", ":tabprev<CR>", opts)
keymap("n", "tn", ":tabnew<CR>", opts)
keymap("n", "tc", ":tabclose<CR>", opts)

-- Copy to EOL
keymap("n", "Y", "y$", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- PLUGINS --
-- Neotree
keymap("n", "\\", ":Neotree filesystem left toggle<CR>", opts)
keymap("n", "|", ":Neotree filesystem reveal left focus<CR>", opts)

-- Telescope
keymap("n", "<C-p>", ":Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>th", ":Telescope colorscheme<CR>", opts)
keymap("n", "<leader>ff", ":lua vim.lsp.buf.format{async=true}<CR>", opts)

-- Github Copilot
vim.g.copilot_no_tab_map = true
keymap("i", "<Tab>", 'copilot#Accept("\\<Tab>")', mergeTables(opts, { expr = true, replace_keycodes = false }))
keymap("i", "<C-l>", "<Plug>(copilot-accept-word)", { silent = true })
keymap("i", "<C-j>", "<Plug>(copilot-accept-line)", { silent = true })
keymap("i", "<C-]>", "<Plug>(copilot-dismiss)", { silent = true })

-- Bufferline
keymap("n", "<tab>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-tab>", ":BufferLineCyclePrev<CR>", opts)

-- Quickfix window: undo global <CR>/<Esc> overrides, add q/<Esc> to close
vim.api.nvim_create_autocmd("FileType", {
  pattern = "qf",
  callback = function(ev)
    vim.keymap.set("n", "<CR>", "<CR>", { buffer = ev.buf, remap = false, silent = true })
    vim.keymap.set("n", "q", "<cmd>cclose<CR>", { buffer = ev.buf, silent = true })
    vim.keymap.set("n", "<Esc>", "<cmd>cclose<CR>", { buffer = ev.buf, silent = true })
  end,
})

-- Commenting (Comment.nvim provides <Plug> mappings; <C-/> covers terminals that send it literally, <C-_> covers the rest)
vim.keymap.set("n", "<C-/>", "<Plug>(comment_toggle_linewise_current)", { silent = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-/>", "<Plug>(comment_toggle_linewise_visual)", { silent = true, desc = "Toggle comment" })
vim.keymap.set("n", "<C-_>", "<Plug>(comment_toggle_linewise_current)", { silent = true, desc = "Toggle comment" })
vim.keymap.set("x", "<C-_>", "<Plug>(comment_toggle_linewise_visual)", { silent = true, desc = "Toggle comment" })
