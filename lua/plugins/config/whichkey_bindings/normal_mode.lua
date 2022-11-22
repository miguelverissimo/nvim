M = {}

M.bindings = {
  ["`"] = {
    name = "Telescope",
    ["`"] = { "<cmd>Telescope<cr>", "Telescope" },
    n = { "<cmd>Telescope notify<cr>", "Notify messages log" },
  },

  a = {
    name = "AutoSession",
    ["?"] = { "<cmd>Autosession search<cr>", "Search session" },
    D = { "<cmd>Autosession delete<cr>", "Delete session" },
    r = { "<cmd>RestoreSession<cr>", "Restore session" },
    s = { "<cmd>SaveSession<cr>", "Save session" },
  },

  b = {
    name = "Buffer",
    --[[ c = { "<Cmd>close<Cr>", "Close split" }, ]]
    w = { "<Cmd>bd!<Cr>", "Close current" },
    D = { "<Cmd>%bd|e#|bd#<Cr>", "Delete all" },
    i = { "mpggVG=<esc>`p", "Indent" },
    c = { "<cmd>set tabstop=2 shiftwidth=2 expandtab | retab<cr>", "Convert tabs to spaces" },
    ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "Goto Buffer 1" },
    ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "Goto Buffer 2" },
    ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "Goto Buffer 3" },
    ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "Goto Buffer 4" },
    ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "Goto Buffer 5" },
    ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "Goto Buffer 6" },
    ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "Goto Buffer 7" },
    ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "Goto Buffer 8" },
    ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "Goto Buffer 9" },
  },

  ['C'] = { "<cmd>ScratchPad<cr>", "Toggle Scratch Pad" },
  ['c'] = { "<cmd>noh<cr>", "Remove highlighting" },

  f = {
    name = "Find",
    a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    d = { "<cmd>Telescope find_dotfiles<cr>", "Dotfiles" },
    e = { "<cmd>RnvimrToggle<CR>", "Ranger" },
    f = { "<cmd>lua require('telescope').extensions.file_browser.file_browser({ previewer = false, })<cr>",
      "File Browser" },
    g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
    h = { "<cmd>Telescope help_tags<cr>", "Help" },
    i = { "<cmd>Telescope highlights<cr>", "Highlights" },
    k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
    m = { "<cmd>Telescope marks<cr>", "Marks" },
    r = { "<cmd>Telescope oldfiles<cr>", "Old Files" },
    p = { "<cmd>Telescope find_files hidden=true layout_config={'prompt_position':'top'}<cr>", "Files" },
    s = { "<cmd>Telescope spell_suggest<cr>", "Spelling" },
    t = { "<cmd>NvimTreeToggle<cr>", "Tree Explorer" },
    w = { "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", "Current Buffer" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Gitsigns toggle_current_line_blame<CR>", "Blame" },
    d = { "<cmd>DiffviewOpen<cr>", "Diff View Open" },
    D = { "<cmd>DiffviewClose<cr>", "Diff View Close" },
    O = { "<cmd>GitConflictChooseOurs<cr>", "Ours" },
    T = { "<cmd>GitConflictChooseTheirs<cr>", "Theirs" },
    B = { "<cmd>GitConflictChooseBoth<cr>", "Both" },
    N = { "<cmd>GitConflictChooseNone<cr>", "None" },
    Q = { "<cmd>GitConflictListQf<cr>", "Quicklist" },
    ["]"] = { "<cmd>GitConflictNextConflict<cr>", "Next" },
    ["["] = { "<cmd>GitConflictPrevConflict<cr>", "Previous" },
    l = { "<cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<cr>",
      "Git Link" }
  },

  ["i"] = { "<cmd>IndentBlanklineToggle<cr>", "Toggle indent lines" },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", "Next Diagnostic" },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
    m = { "<cmd>Mason<cr>", "Mason installer" },
    n = { "<cmd>NullLsInfo<cr>", "Null-ls info" },
    q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
    S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
    t = { "<cmd>lua require('lsp_lines').toggle()<cr>", "Toggle diagnostics virtual text" },
    w = { "<cmd>Telescope diagnostics<cr>", "Workspace Diagnostics" },
  },

  ["n"] = { "<cmd>Alpha<cr>", "Show startup screen" },

  p = {
    name = "Plugins",
    i = { "<cmd>PackerInstall<cr>", "Install" },
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    p = { "<cmd>PackerProfile<cr>", "Profile" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    S = { "<cmd>PackerStatus<cr>", "Status" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },

  r = {
    name = "Refactoring",
    e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], "Extract Function" },
    f = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], "Extract Function to File" },
    v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]], "Extract Variable" },
    i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]], "Inline Variable" },
    b = { [[ <Cmd>lua require('refactoring').refactor('Extract Block')<CR>]], "Extract Block" },
  },

  s = {
    name = "System",
    e = { "!!$SHELL<CR>", "Execute Shell" },
    f = { "<cmd>echo &filetype<cr>", "Filetype" },
    g = { "<cmd>Grepper<cr>", "Grepper" },
    r = { "<cmd>luafile %<cr> <cmd>lua vim.notifier.info('Sourced file')<cr>", "Source file" },
    s = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
    x = { "<cmd>cd %:p:h<cr>", "Change Directory" },
    w = { "<cmd>update!<CR>", "Save" },
  },

  t = {
    name = "Test",
    t = { "<cmd>TestNearest<cr><cr>", "Test Nearest" },
    f = { "<cmd>TestFile<cr><cr>", "Test File" },
    l = { "<cmd>TestLast<cr>", "Test Last" },
    o = { "<cmd>TestVisit<cr>", "Open last run test file" },
    e = { "<cmd>TestEdit<cr>", "Edit tests for current file" },
    i = { "<cmd>TestInfo<cr>", "Plugin info" },
    s = { "<cmd>TestSuite<cr>", "Test full suite" },
    A = { "<cmd>lua require('neotest').run.attach()<cr>", "NeoTest Attach" },
    F = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "NeoTest Run All" },
    L = { "<cmd>lua require('neotest').run.run_last()<cr>", "NeoTest Run Last" },
    T = { "<cmd>lua require('neotest').run.run()<cr>", "NeoTest Run Nearest" },
    O = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "NeoTest Output" },
    X = { "<cmd>lua require('neotest').run.stop()<cr>", "NeoTest Stop" },
    S = { "<cmd>lua require('neotest').summary.toggle()<cr>", "NeoTest Summary" },
  },

  v = {
    name = "Splits",
    h = { "<cmd>split<cr>", "Horizontal split" },
    v = { "<cmd>vsplit<cr>", "Vertical split" },
  },

  x = {
    name = "Trouble",
    x = { "<cmd>TroubleToggle<cr>", "Toggle" },
    w = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace Diagnostics" },
    d = { "<cmd>Trouble document_diagnostics<cr>", "Document Diagnostics" },
    l = { "<cmd>Trouble loclist<cr>", "Loclist" },
    q = { "<cmd>Trouble quickfix<cr>", "Quick Fix" },
    r = { "<cmd>Trouble lsp_references<cr>", "LSP References" },
  },

  y = {
    name = "Yank",
    p = { "<cmd>let @+ = expand('%:p')<cr> <cmd>lua vim.notifier.info('Yanked filepath')<cr>", "Filepath" },
    a = { "<cmd>%y<cr>", "Buffer contents" },
  },

  z = {
    name = "Terminal",
    l = { "<cmd>:lua _toggle_lazygit()<cr>", "Lazygit" },
    c = { "<cmd>:lua _toggle_console()<cr>", "Rails Console" },
    i = { "<cmd>:lua _toggle_irb()<cr>", "IRB" },
    h = { "<cmd>:lua _toggle_htop()<cr>", "htop" },
    z = { "<cmd>:lua _toggle_shell()<cr>", "Open terminal" }
  },
}

return M
