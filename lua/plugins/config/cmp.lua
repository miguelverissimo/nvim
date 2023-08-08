local M = {}

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
end

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- autocmd BufWritePost * :execute "luafile %" | :execute "PackerSync"

local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}


function M.init()
  if not packer_plugins["plenary.nvim"].loaded then
    vim.cmd([[packadd plenary.nvim]])
  end
  local cmp = require("cmp")
  local lspkind = require("lspkind")
  local luasnip = require("luasnip")

  local mapping = {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- they way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-d>"] = cmp.mapping.scroll_docs(-4),

    ["<C-f>"] = cmp.mapping.scroll_docs(4),

    ["<C-Space>"] = cmp.mapping(function(_)
      return vim.fn.pumvisible() == 1 and cmp.close() or cmp.complete()
    end),

    ["<C-e>"] = cmp.mapping.close(),
    --[[ ["<C-g>"] = cmp.mapping.confirm({ select = true }), ]]

    ["<CR>"] = cmp.mapping({
      i = function(fallback)
        if cmp.visible() and cmp.get_active_entry() then
          cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
        else
          fallback()
        end
      end,
      s = cmp.mapping.confirm({ select = true }),
      c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),
  }
  -- Ignore warning msg "The same file is required" lua_ls gives for the below
  -- requires statement. It is needed for the cmp completion window to pop up.
  --[[ require("plugins.config.luasnip") ]]

  cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind
        --[[ vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) ]]

        -- set a name for each source
        vim_item.menu = ({
          buffer = "[buf]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[Lua]",
          luasnip = "[LuaSnip]",
          path = "[Path]",
        })[entry.source.name]
        return vim_item
      end,
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    completion = {
      completeopt = "menu,menuone,noselect,noinsert",
      keyword_length = 2,
    },
    mapping = mapping,
    preselect = cmp.PreselectMode.None,

    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "path" },
      {
        name = "buffer",
        option = {
          get_bufnrs = function()
            -- use all open buffers
            return vim.api.nvim_list_bufs()
          end,
        }
      },
    },
  })

  cmp.setup.cmdline("/", {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {},
  })

  --[[ cmp.setup.cmdline(":", { ]]
  --[[   sources = cmp.config.sources({ ]]
  --[[     { name = "path" }, ]]
  --[[   }, { ]]
  --[[     { name = "cmdline" }, ]]
  --[[   }), ]]
  --[[ }) ]]
end

return M
