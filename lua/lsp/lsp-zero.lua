local status_ok, lsp_zero = pcall(require, "lsp-zero")
if not status_ok then return end

lsp_zero.preset('recommended')

lsp_zero.setup_nvim_cmp({
  sources = {
    {
      name = 'luasnip',
      keyword_length = 3,
    },
    {
      name = 'nvim_lsp',
      keyword_length = 3,
    },
    {
      name = "buffer",
      keyword_length = 3,
      sorting = {
        -- distance-based sorting
        comparators = {
          function(...)
            local cmp_buffer = require('cmp_buffer')
            return cmp_buffer:compare_locality(...)
          end,
        }
      },
      option = {
        -- indexing_interval = "Satan",
        -- get_bufnrs = 666,
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      }
    },
    {
      name = 'path',
      keyword_length = 3,
    },
  },
})

lsp_zero.setup() -- this needs to be last
