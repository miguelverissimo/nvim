--[[ local cmp_status_ok, cmp = pcall(require, "cmp") ]]
--[[ if not cmp_status_ok then return end ]]
--[[]]
--[[ local snip_status_ok, luasnip = pcall(require, "luasnip") ]]
--[[ if not snip_status_ok then return end ]]
--[[]]
--[[ local cmp_buffer_ok, cmp_buffer = pcall(require, "cmp_buffer") ]]
--[[ if not cmp_buffer_ok then return end ]]
--[[]]
--[[ local cmp_under_comparator_ok, cmp_under_comparator = pcall(require, "cmp-under-comparator") ]]
--[[ if not cmp_under_comparator_ok then return end ]]
--[[]]
--[[ -- Required or snippets will not be added to the completion options ]]
--[[ require("luasnip/loaders/from_vscode").lazy_load() ]]
--[[]]
--[[ local check_backspace = function() ]]
--[[   local col = vim.fn.col "." - 1 ]]
--[[   return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ]]
--[[ end ]]
--[[]]
--[[ local kind_icons = { ]]
--[[   Text = "", ]]
--[[   Method = "", ]]
--[[   Function = "", ]]
--[[   Constructor = "", ]]
--[[   Field = "", ]]
--[[   Variable = "", ]]
--[[   Class = "ﴯ", ]]
--[[   Interface = "", ]]
--[[   Module = "", ]]
--[[   Property = "ﰠ", ]]
--[[   Unit = "", ]]
--[[   Value = "", ]]
--[[   Enum = "", ]]
--[[   Keyword = "", ]]
--[[   Snippet = "", ]]
--[[   Color = "", ]]
--[[   File = "", ]]
--[[   Reference = "", ]]
--[[   Folder = "", ]]
--[[   EnumMember = "", ]]
--[[   Constant = "", ]]
--[[   Struct = "", ]]
--[[   Event = "", ]]
--[[   Operator = "", ]]
--[[   TypeParameter = "" ]]
--[[ } ]]
--[[]]
--[[ cmp.setup { ]]
--[[   snippet = { ]]
--[[     expand = function(args) ]]
--[[       luasnip.lsp_expand(args.body) ]]
--[[     end, ]]
--[[   }, ]]
--[[   mapping = { ]]
--[[     ["<C-n>"] = cmp.mapping(function(fallback) ]]
--[[       if cmp.visible() then ]]
--[[         cmp.select_next_item() ]]
--[[       elseif luasnip.jumpable(1) then ]]
--[[         luasnip.jump(1) ]]
--[[       elseif luasnip.expandable() then ]]
--[[         luasnip.expand() ]]
--[[       elseif luasnip.expand_or_jumpable() then ]]
--[[         luasnip.expand_or_jump() ]]
--[[       elseif check_backspace() then ]]
--[[         fallback() ]]
--[[       else ]]
--[[         fallback() ]]
--[[       end ]]
--[[     end, { "i", "s" }), ]]
--[[     ["<C-p>"] = cmp.mapping(function(fallback) ]]
--[[       if cmp.visible() then ]]
--[[         cmp.select_prev_item() ]]
--[[       elseif luasnip.jumpable(-1) then ]]
--[[         luasnip.jump(-1) ]]
--[[       else ]]
--[[         fallback() ]]
--[[       end ]]
--[[     end, { "i", "s" }), ]]
--[[     ["<C-d>"] = cmp.mapping.scroll_docs(-4), ]]
--[[     ["<C-f>"] = cmp.mapping.scroll_docs(4), ]]
--[[     ["<C-Space>"] = cmp.mapping.complete(), ]]
--[[     ["<C-e>"] = cmp.mapping { ]]
--[[       i = cmp.mapping.abort(), ]]
--[[       c = cmp.mapping.close(), ]]
--[[     }, ]]
--[[     ["<CR>"] = cmp.mapping.confirm({ ]]
--[[       select = true, ]]
--[[     }), ]]
--[[   }, ]]
--[[   formatting = { ]]
--[[     fields = { "kind", "abbr", "menu" }, ]]
--[[     format = function(entry, vim_item) ]]
--[[       vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) ]]
--[[]]
--[[       vim_item.menu = ({ ]]
--[[         buffer = "[Buffer]", ]]
--[[         luasnip = "[Snippet]", ]]
--[[         nvim_lsp = "[LSP]", ]]
--[[         -- nvim_lua = "[Lua]", ]]
--[[       })[entry.source.name] ]]
--[[]]
--[[       return vim_item ]]
--[[     end ]]
--[[   }, ]]
--[[   sources = { ]]
--[[     { name = "nvim_lsp" }, ]]
--[[     { name = "nvim_lua" }, ]]
--[[     { name = "luasnip" }, ]]
--[[     { name = "path" }, ]]
--[[     { name = "buffer", keyword_length = 3 }, ]]
--[[   }, ]]
--[[   confirm_opts = { ]]
--[[     behavior = cmp.ConfirmBehavior.Replace, ]]
--[[     select = false, ]]
--[[   }, ]]
--[[   sorting = { ]]
--[[     comparators = { ]]
--[[       function(...) return cmp_buffer:compare_locality(...) end, ]]
--[[       cmp.config.compare.offset, ]]
--[[       cmp.config.compare.exact, ]]
--[[       cmp.config.compare.score, ]]
--[[       cmp_under_comparator.under, ]]
--[[       cmp.config.compare.kind, ]]
--[[       cmp.config.compare.sort_text, ]]
--[[       cmp.config.compare.length, ]]
--[[       cmp.config.compare.order, ]]
--[[     }, ]]
--[[   }, ]]
--[[   window = { ]]
--[[     documentation = { ]]
--[[       border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }, ]]
--[[     }, ]]
--[[   }, ]]
--[[   experimental = { ]]
--[[     ghost_text = false, ]]
--[[     native_menu = false, ]]
--[[   }, ]]
--[[   enabled = function() ]]
--[[     local in_prompt = vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt' ]]
--[[     if in_prompt then  -- this will disable cmp in the Telescope window (taken from the default config) ]]
--[[       return false ]]
--[[     end ]]
--[[     local context = require("cmp.config.context") ]]
--[[     return not(context.in_treesitter_capture("comment") == true or context.in_syntax_group("Comment")) ]]
--[[   end ]]
--[[ } ]]
--[[]]
--[[ cmp.setup.cmdline(":", { ]]
--[[   completion = { autocomplete = false }, ]]
--[[   sources = { ]]
--[[     { name = "cmdline" } ]]
--[[   }, ]]
--[[   mapping = cmp.mapping.preset.cmdline({}), ]]
--[[ }) ]]
--[[]]
--[[ cmp.setup.cmdline("/", { ]]
--[[   completion = { autocomplete = false }, ]]
--[[   sources = cmp.config.sources( ]]
--[[     { ]]
--[[       { name = "buffer" } ]]
--[[     }, ]]
--[[     { ]]
--[[       { name = "nvim_lsp_document_symbol" } ]]
--[[     } ]]
--[[   ), ]]
--[[   mapping = cmp.mapping.preset.cmdline({}), ]]
--[[ }) ]]
--[[]]
-- vim.cmd([[
-- augroup NvimCmp
-- au!
-- au FileType TelescopePrompt lua cmp.setup.buffer { enabled = false }
-- augroup END
-- ]])



local M = {}

local check_back_space = function()
  local col = vim.fn.col(".") - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match("%s") ~= nil
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

  -- Ignore warning msg "The same file is required" lua_ls gives for the below
  -- requires statement. It is needed for the cmp completion window to pop up.
  require("plugins.cmp.luasnip").init()

  cmp.setup({
    formatting = {
      format = function(entry, vim_item)
        -- fancy icons and a name of kind
        --[[ vim_item.kind = lspkind.presets.default[vim_item.kind] .. " " .. vim_item.kind ]]
        vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)

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
      keyword_length = 1,
    },
    mapping = {
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip and luasnip.jumpable(-1) then
          luasnip.jump(-1)
        elseif check_back_space() then
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<s-tab>", true, true, true),
            "n",
            true
          )
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip and luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif packer_plugins["neogen"].loaded then
          local neogen = require("neogen")
          if neogen ~= nil and neogen.jumpable() then
            vim.api.nvim_feedkeys(
              vim.api.nvim_replace_termcodes(
                "<cmd>lua require('neogen').jump_next()<CR>",
                true,
                true,
                true
              ),
              "",
              true
            )
          end
        elseif check_back_space() then
          vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes("<tab>", true, true, true),
            "n",
            true
          )
        else
          fallback()
        end
      end, {
        "i",
        "s",
        "c",
      }),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping(function(_)
        return vim.fn.pumvisible() == 1 and cmp.close() or cmp.complete()
      end),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    -- preselect = cmp.PreselectMode.Item,
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
    sources = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    sources = cmp.config.sources({
      { name = "path" },
    }, {
      { name = "cmdline" },
    }),
  })
end

return M
