local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

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

-- Normal --
-- Save with enter
keymap("n", "<CR>", ":w<CR>", opts)

-- Disable search highlight
keymap("n", "<Esc><Esc>", ":<C-u>nohlsearch<CR>", opts)

-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-k>", ":resize -2<CR>", opts)
keymap("n", "<C-j>", ":resize +2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

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

-- Testing shortcuts
keymap("n", "<leader>tt", ":TestNearest<CR>", opts)
keymap("n", "<leader>tf", ":TestFile<CR>", opts)
keymap("n", "<leader>t.", ":TestLast<CR>", opts)
keymap("n", "<leader>ts", ":TestSuite<CR>", opts)
keymap("n", "<leader>tg", ":TestVisit<CR>", opts)

-- Commentary (also set in xmap and omap)
keymap("n", "<c-_>", "<Plug>CommentaryLine", opts)

-- Telescope
keymap("n", "<C-p>", "<cmd>Telescope find_files hidden=true<CR>", opts)
keymap("n", "<leader>ss", "<cmd>Telescope live_grep<CR>", opts)

-- NvimTreeToggle
keymap("n", "\\", "<cmd>NvimTreeToggle<CR>", opts)
keymap("n", "|", "<cmd>NvimTreeFindFile<CR>", opts)

-- Insert --
-- Press jk fast to exit insert mode 
keymap("i", "jk", "<ESC>", opts)
keymap("i", "kj", "<ESC>", opts)

-- Copy to system clipboard
keymap("i", "<C-v>", "<ESC>\"+pa", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Copy to system clipboard
keymap("v", "<C-c>", "\"+y", opts)
keymap("v", "<C-x>", "\"+c", opts)
keymap("v", "<C-v>", "c<ESC>\"+p", opts)

-- Indent/dedent using tab/shift-tab or >/<
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
keymap("v", "<Tab>", ">gv", opts)
keymap("v", "<S-Tab>", "<gv", opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Commentary (also set in nmap and omap)
keymap("x", "<c-_>", "<Plug>Commentary", opts)

-- Object --
-- Commentary (also set in nmap and xmap)
keymap("o", "<c-_>", "<Plug>Commentary", opts)

-- Terminal --
-- Better terminal navigation
-- keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
-- keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
-- keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
-- keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
