return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    spec = {
      -- AutoSession
      { "<leader>a", group = "AutoSession" },
      { "<leader>a?", "<cmd>SessionSearch<cr>", desc = "Search session" },
      { "<leader>aD", "<cmd>SessionDelete<cr>", desc = "Delete session" },
      { "<leader>ar", "<cmd>SessionRestore<cr>", desc = "Restore session" },
      { "<leader>as", "<cmd>SessionSave<cr>", desc = "Save session" },

      -- Buffer
      { "<leader>b", group = "Buffer" },
      { "<leader>bw", "<cmd>bd!<cr>", desc = "Close current" },
      { "<leader>bi", "mpggVG=<esc>`p", desc = "Indent" },
      { "<leader>bc", "<cmd>set tabstop=2 shiftwidth=2 expandtab | retab<cr>", desc = "Tabs to spaces" },
      { "<leader>b1", "<cmd>BufferLineGoToBuffer 1<cr>", desc = "Goto Buffer 1" },
      { "<leader>b2", "<cmd>BufferLineGoToBuffer 2<cr>", desc = "Goto Buffer 2" },
      { "<leader>b3", "<cmd>BufferLineGoToBuffer 3<cr>", desc = "Goto Buffer 3" },
      { "<leader>b4", "<cmd>BufferLineGoToBuffer 4<cr>", desc = "Goto Buffer 4" },
      { "<leader>b5", "<cmd>BufferLineGoToBuffer 5<cr>", desc = "Goto Buffer 5" },
      { "<leader>b6", "<cmd>BufferLineGoToBuffer 6<cr>", desc = "Goto Buffer 6" },
      { "<leader>b7", "<cmd>BufferLineGoToBuffer 7<cr>", desc = "Goto Buffer 7" },
      { "<leader>b8", "<cmd>BufferLineGoToBuffer 8<cr>", desc = "Goto Buffer 8" },
      { "<leader>b9", "<cmd>BufferLineGoToBuffer 9<cr>", desc = "Goto Buffer 9" },

      -- Single-key
      { "<leader>C", "<cmd>noh<cr>", desc = "Remove highlighting" },
      { "<leader>f", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format file" },
      { "<leader>i", "<cmd>IBLToggle<cr>", desc = "Toggle indent lines" },

      -- Claude
      { "<leader>c", group = "Claude" },
      { "<leader>cc", desc = "Toggle" },
      { "<leader>cC", desc = "Toggle (--continue)" },
      { "<leader>cV", desc = "Toggle (--verbose)" },

      -- Grep
      { "<leader>gs", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
      {
        "<leader>gz",
        function()
          require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
        end,
        desc = "Live grep word under cursor",
      },

      -- Find (Telescope)
      { "<leader>F", group = "Find" },
      { "<leader>Fa", "<cmd>Telescope autocommands<cr>", desc = "Autocommands" },
      { "<leader>Fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>Fc", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "<leader>Fg", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
      { "<leader>Fh", "<cmd>Telescope help_tags<cr>", desc = "Help" },
      { "<leader>Fi", "<cmd>Telescope highlights<cr>", desc = "Highlights" },
      { "<leader>Fk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      { "<leader>Fm", "<cmd>Telescope marks<cr>", desc = "Marks" },
      { "<leader>Fr", "<cmd>Telescope oldfiles<cr>", desc = "Old Files" },
      { "<leader>Fp", "<cmd>Telescope find_files hidden=true<cr>", desc = "Files" },
      { "<leader>Fs", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling" },
      { "<leader>Ft", "<cmd>Neotree filesystem left toggle<cr>", desc = "Tree Explorer" },
      { "<leader>Fw", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>", desc = "Current Buffer" },
      {
        "<leader>Fz",
        function()
          require("telescope.builtin").live_grep({ default_text = vim.fn.expand("<cword>") })
        end,
        desc = "Grep word under cursor",
      },

      -- LSP
      { "<leader>l", group = "LSP" },
      { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action" },
      { "<leader>ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics" },
      { "<leader>lf", "<cmd>lua vim.lsp.buf.format({ async = true })<cr>", desc = "Format" },
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "Info" },
      { "<leader>lj", "<cmd>lua vim.diagnostic.jump({ count = 1, float = true })<cr>", desc = "Next Diagnostic" },
      { "<leader>lk", "<cmd>lua vim.diagnostic.jump({ count = -1, float = true })<cr>", desc = "Prev Diagnostic" },
      { "<leader>lK", "<cmd>lua vim.lsp.buf.hover()<cr>", desc = "Hover" },
      { "<leader>ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action" },
      { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason installer" },
      { "<leader>ln", "<cmd>NullLsInfo<cr>", desc = "None-ls info" },
      { "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix" },
      { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename" },
      { "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols" },
      { "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols" },
      { "<leader>lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics" },

      -- Plugins
      { "<leader>P", "<cmd>Lazy<cr>", desc = "Lazy" },

      -- System
      { "<leader>s", group = "System" },
      { "<leader>se", "!!$SHELL<cr>", desc = "Execute Shell" },
      { "<leader>sf", "<cmd>echo &filetype<cr>", desc = "Filetype" },
      { "<leader>sg", "<cmd>silent! Grepper<cr>", desc = "Grepper" },
      { "<leader>sr", "<cmd>luafile %<cr>", desc = "Source file" },
      { "<leader>ss", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
      { "<leader>sx", "<cmd>cd %:p:h<cr>", desc = "Change Directory" },
      { "<leader>sw", "<cmd>update!<cr>", desc = "Save" },

      -- Splits
      { "<leader>v", group = "Splits" },
      { "<leader>vh", "<cmd>split<cr>", desc = "Horizontal split" },
      { "<leader>vv", "<cmd>vsplit<cr>", desc = "Vertical split" },

      -- Yank
      { "<leader>y", group = "Yank" },
      { "<leader>yp", "<cmd>let @+ = expand('%:p')<cr>", desc = "Filepath" },
      { "<leader>ya", "<cmd>%y<cr>", desc = "Buffer contents" },
    },
  },
}
