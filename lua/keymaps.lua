-------------------------------------------------------------------------------
-- General Keybindings, not plugin specific
-------------------------------------------------------------------------------
local opts = { silent = true, noremap = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

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

-- Turn off arrow keys - force HJKL
--[[ keymap("n", "<UP>", "<NOP>", opts) ]]
--[[ keymap("n", "<DOWN>", "<NOP>", opts) ]]
--[[ keymap("n", "<LEFT>", "<NOP>", opts) ]]
--[[ keymap("n", "<RIGHT>", "<NOP>", opts) ]]

-- Save with enter
keymap("n", "<CR>", ":w<CR>", opts)

-- Map ctrl-c to esc
keymap("i", "<C-c>", "<esc>", opts)

-- Use Del key for black hole register
keymap("", "<Del>", '"_x', opts)

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

-- Remove highlighting
keymap("n", "<leader>c", "<cmd>noh<cr>", opts)
keymap("n", "<Esc><Esc>", ":<C-u>nohlsearch<CR>", opts)

-- Ctrl-c to esc
keymap("i", "<C-c>", "<esc>", opts)

-- Escape in normal mode seems to tab
keymap("n", "<esc>", "<NOP>", opts)

-- Navigate quicklist items
keymap("n", "gn", "<cmd>cnext<cr>", opts)
keymap("n", "gp", "<cmd>cprev<cr>", opts)

-- Navigate tabs
keymap("n", "tl", ":tabnext<CR>", opts)
keymap("n", "th", ":tabprev<CR>", opts)
keymap("n", "tn", ":tabnew<CR>", opts)
keymap("n", "tc", ":tabclose<CR>", opts)

-- Quicker splits
keymap("n", "<leader>vv", ":vsplit<CR>", opts)
keymap("n", "<leader>vh", ":split<CR>", opts)

-- Copy to EOL
keymap("n", "Y", "y$", opts)

-- ESC to clear search
keymap("n", "<esc>", ":noh<CR>", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-------------------------------------------------------------------------------
-- Buffers
-------------------------------------------------------------------------------
-- Delete buffer
--[[ keymap("n", "<c-w>", ":bd<CR>", opts) ]]

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-------------------------------------------------------------------------------
-- Splits
-------------------------------------------------------------------------------
-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize splits with alt+cursor keys
keymap("n", "<M-Up>", ":resize +2<CR>", opts)
keymap("n", "<M-Down>", ":resize -2<CR>", opts)
keymap("n", "<M-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<M-Right>", ":vertical resize +2<CR>", opts)

-------------------------------------------------------------------------------
-- Plugins
-------------------------------------------------------------------------------

-- Telescope
keymap("n", "<C-p>", "<cmd>Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>ss", "<cmd>Telescope live_grep<CR>", opts)

-- NvimTreeToggle
keymap("n", "\\", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "|", "<cmd>NvimTreeFindFile<CR>", opts)

-- Grepper
keymap("n", "<leader>sg", ":Grepper<CR>", opts)

-- Trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>", opts)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", opts)
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", opts)
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opts)

-- Commentary (also set in nmap and xmap)
--[[ keymap("n", "<c-_>", "<Plug>CommentaryLine", opts) ]]
--[[ keymap("x", "<c-_>", "<Plug>Commentary", opts) ]]
--[[ keymap("o", "<c-_>", "<Plug>Commentary", opts) ]]
