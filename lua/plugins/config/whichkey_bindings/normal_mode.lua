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
    --[[ c = { "<cmd>close<cr>", "Close split" }, ]]
    w = { "<cmd>bd!<cr>", "Close current" },
    --[[ D = { "<cmd>%bd|e#|bd#<cr>", "Delete all" }, ]]
    D = { "<cmd>DeleteHiddenBuffers<cr>", "Delete all" },
    i = { "mpggVG=<esc>`p", "Indent" },
    c = { "<cmd>set tabstop=2 shiftwidth=2 expandtab | retab<cr>", "Convert tabs to spaces" },
    ["1"] = { "<cmd>BufferLineGoToBuffer 1<cr>", "Goto Buffer 1" },
    ["2"] = { "<cmd>BufferLineGoToBuffer 2<cr>", "Goto Buffer 2" },
    ["3"] = { "<cmd>BufferLineGoToBuffer 3<cr>", "Goto Buffer 3" },
    ["4"] = { "<cmd>BufferLineGoToBuffer 4<cr>", "Goto Buffer 4" },
    ["5"] = { "<cmd>BufferLineGoToBuffer 5<cr>", "Goto Buffer 5" },
    ["6"] = { "<cmd>BufferLineGoToBuffer 6<cr>", "Goto Buffer 6" },
    ["7"] = { "<cmd>BufferLineGoToBuffer 7<cr>", "Goto Buffer 7" },
    ["8"] = { "<cmd>BufferLineGoToBuffer 8<cr>", "Goto Buffer 8" },
    ["9"] = { "<cmd>BufferLineGoToBuffer 9<cr>", "Goto Buffer 9" },
  },

  ['C'] = { "<cmd>silent! ScratchPad<cr>", "Toggle Scratch Pad" },
  ['c'] = { "<cmd>noh<cr>", "Remove highlighting" },

  f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format file" },
  F = {
    name = "Find",
    a = { "<cmd>Telescope autocommands<cr>", "Autocommands" },
    b = { "<cmd>Telescope buffers<cr>", "Buffers" },
    c = { "<cmd>Telescope commands<cr>", "Commands" },
    d = { "<cmd>Telescope find_dotfiles<cr>", "Dotfiles" },
    e = { "<cmd>RnvimrToggle<cr>", "Ranger" },
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
    z = { '<cmd>lua require(\'telescope.builtin\').grep_string({search = vim.fn.expand("<cword>")})<cr>',
      "Grep word under cursor" },
  },

  g = {
    name = "Git",
    b = { "<cmd>Git blame<cr>", "Blame file" },
    l = { "<cmd>Gitsigns toggle_current_line_blame<cr>", "Blame line" },
    d = { "<cmd>DiffviewOpen<cr>", "Diff View Open" },
    D = { "<cmd>DiffviewClose<cr>", "Diff View Close" },
    O = { "<cmd>GitConflictChooseOurs<cr>", "Ours" },
    T = { "<cmd>GitConflictChooseTheirs<cr>", "Theirs" },
    B = { "<cmd>GitConflictChooseBoth<cr>", "Both" },
    N = { "<cmd>GitConflictChooseNone<cr>", "None" },
    Q = { "<cmd>GitConflictListQf<cr>", "Quicklist" },
    ["]"] = { "<cmd>GitConflictNextConflict<cr>", "Next" },
    ["["] = { "<cmd>GitConflictPrevConflict<cr>", "Previous" },
    L = { "<cmd>lua require('gitlinker').get_buf_range_url('n', { action_callback = require('gitlinker.actions').open_in_browser })<cr>",
      "Git Link" }
  },

  ["i"] = { "<cmd>IndentBlanklineToggle<cr>", "Toggle indent lines" },

  l = {
    name = "LSP",
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
    d = { "<cmd>Telescope diagnostics bufnr=0<cr>", "Document Diagnostics" },
    f = { "<cmd>lua vim.lsp.buf.format{async=true}<cr>", "Format" },
    i = { "<cmd>LspInfo<cr>", "Info" },
    j = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
    k = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
    K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Show definition" },
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
    name = "Pomodoro",
    s = { "<cmd>PomodoroStart<cr>", "Start" },
    S = { "<cmd>PomodoroStop<cr>", "Stop" },
  },

  P = {
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
    b = { [[ <Cmd>lua require('refactoring').refactor('Extract Block')<cr>]], "Extract Block" },
    e = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<cr>]], "Extract Function" },
    f = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<cr>]], "Extract Function to File" },
    i = { [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<cr>]], "Inline Variable" },
    r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    v = { [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<cr>]], "Extract Variable" },
  },

  s = {
    name = "System",
    e = { "!!$SHELL<cr>", "Execute Shell" },
    f = { "<cmd>echo &filetype<cr>", "Filetype" },
    g = { "<cmd>silent! Grepper<cr>", "Grepper" },
    r = { "<cmd>luafile %<cr> <cmd>lua vim.notifier.info('Sourced file')<cr>", "Source file" },
    s = { "<cmd>Telescope live_grep<cr>", "Telescope live grep" },
    x = { "<cmd>cd %:p:h<cr>", "Change Directory" },
    w = { "<cmd>update!<cr>", "Save" },
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
