local options = {
  -- General
  autoread = true, -- reload changes from disk
  autowriteall = true, -- Writes on make/shell commands
  clipboard = "unnamedplus", -- allows neovim to access the system clipboard
  hidden = true, -- Allow buffer switching without saving
  linespace = 0, -- No extra spaces between rows
  matchtime = 1, -- Time to show the match for
  wrap = false, -- Do not wrap long lines
  relativenumber = true, --  relative numbered lines
  report = 0, -- Always report changed lines
  scrolloff = 8, -- Minumum lines to keep above and below cursor
  sidescrolloff = 8, -- Same but sideways
  showmatch = true, -- Show matching brackets/parentthesis
  splitbelow = true, -- force all horizontal splits to go below current window
  splitright = true, -- force all vertical splits to go to the right of current window
  termguicolors = true, --  term gui colors (most terminals support this)
  updatetime = 100, -- Update swap file and CursorHold delay (defaults to 400)
  timeoutlen = 500, -- Timeout for keybindings
  ttimeoutlen = 0, -- Timeout for completing commands
  inccommand = "nosplit", -- Preview commands like substitute
  ignorecase = true, -- ignore case in search patterns...
  smartcase = true, -- ... but case sensitive when uppercase present
  scrollback = 50000, -- Lines kept beyong the visible screen. Because logfiles
  icm = "split", -- not sure what this does
  synmaxcol = 500, -- Stop syntax checking on line at this position

  -- Mouse
  mouse = "niv", -- allow the mouse to be used in neovim

  -- Completion
  completeopt = { "menu", "menuone", "noselect" }, -- mostly just for cmp

  -- Indentation
  expandtab = true, -- convert tabs to spaces
  shiftwidth = 2, -- the number of spaces inserted for each indentation
  showtabline = 2, -- always show tabs
  softtabstop = 2, -- let backspace delete indent
  tabstop = 2, -- insert 2 spaces for a tab
  smartindent = true, -- make indenting smarter again

  -- Visible Whitespace
  listchars = { trail = '·', precedes = '«', extends = '»', eol = '↲', tab = '▸ ' },
  list = false,

  -- Undo
  undofile = true, -- enable persistent undo
  undolevels = 1000, -- max number of undos
  undoreload = 10000, -- max number of lines to save for undo on a buffer reload

  -- Command mode
  showmode = false, -- we don't need to see things like -- INSERT -- anymore
  wildmode = { list = "longest" }, -- Use emacs-style tab completion in command mode

  -- Folds
  foldenable = true,
  --[[ foldcolumn = '1', -- Needed for nvim-ufo ]]
  foldlevel = 0, -- Typically 0, but nvim-ufo needs a large value
  foldlevelstart = 99,
  foldmethod = "expr", -- Use together with foldexpr
  foldexpr = "nvim_treesitter#foldexpr()",

  -- Visuals
  background = "dark",
  cmdheight = 2, -- more space in the neovim command line for displaying messages
  colorcolumn = "80,120",
  conceallevel = 0, -- so that `` is visible in markdown files
  cursorline = true, -- highlight the current line
  number = true, --  numbered lines
  numberwidth = 4, --  number column width to 4
  signcolumn = "yes", -- always show the sign column, otherwise it would shift the text each time
  laststatus = 3, -- Universal status bar

  -- Backups and swap
  writebackup = false, -- if a file is being edited by another program
  backup = false, -- do not create a backup file
  swapfile = false, -- creates a swapfile
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Disable some builtin vim plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "tutor",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- vim.opt.winbar = "%{%v:lua.require('user.winbar').get_winbar()%}"

vim.opt.shortmess:append "acsI" -- disable nvim intro
vim.opt.whichwrap:append "<>[]hl" -- go to previous/next line with h,l

vim.opt.path:remove "/usr/include" -- Better search
vim.opt.path:append "**" -- Better search

vim.opt.wildignorecase = true
vim.opt.wildignore:append "**/node_modules/*"
vim.opt.wildignore:append "**/.git/*"
vim.opt.iskeyword:append({ "$", "@", "-" }) -- Add extra characters that are valid parts of variables

-- Custom fold text
require "functions.custom_fold_text"
