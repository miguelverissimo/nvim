local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then return end

require("lsp.config")
require("lsp.handlers").setup()


local function lsp_keymaps(bufnr)
  local opts = { silent = true, noremap = true }
  local keymap = vim.api.nvim_buf_set_keymap

  keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>", opts)
  keymap(bufnr, "n","<C-K>", "<cmd>vim.lsp.buf.signature_help()<cr>", opts)

  keymap(bufnr, "n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
  keymap(bufnr, "n", "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
  keymap(bufnr, "n", "<leader>li", "<cmd>LspInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
  keymap(bufnr, "n", "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
  keymap(bufnr, "n", "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  keymap(bufnr, "n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", opts)
  keymap(bufnr, "n", "<leader>lS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", opts)
  keymap(bufnr, "n", "<leader>lw", "<cmd>Telescope diagnostics<cr>", opts)
end

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      if client.name == "solargraph" then
        return true
      elseif client.name == "lua_ls" then
        return true
      else
        vim.notify("buf.format client: " .. client.name)
        return client.name == "null-ls"
      end
    end,
    bufnr = bufnr,
  })
end

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    local opts = { buffer = ev.buf }


    -- if you want to set up formatting on save, you can use this as a callback
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

    -- add to your shared on_attach callback
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = opts.buffer })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = opts.buffer,
      callback = function()
        vim.notify('Autoformatting')
        lsp_formatting(opts.buffer)
      end,
    })

    lsp_keymaps(opts.buffer)
  end,
})
