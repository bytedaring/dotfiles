local M = {}

M.setup = function ()
  local cmp = require'cmp'
  -- luasnip setup
  local luasnip = require'luasnip'

  vim.o.completeopt = "menu,menuone,noselect"

  cmp.setup{
    window = {
      completion = {
        winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
      },
    },
    formatting = {
      format = function (_, vim_item)
        local icons = require("core.icons").lspkind
        vim_item.kind = string.format("%s %s", icons[vim_item.kind], vim_item.kind)
        -- vim_item.kind = string.format("%s", icons[vim_item.kind])
        return vim_item
      end,
    },
    snippet = {
      expand = function (args)
        require('luasnip').lsp_expand(args.body)
      end,
    },
    mapping = {
      ['<C-p>'] = cmp.mapping.select_prev_item(),
      ['<C-n>'] = cmp.mapping.select_next_item(),
      ['<C-d>'] = cmp.mapping.scroll_docs( -4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm{
        behavior = cmp.ConfirmBehavior.Replace,
        select = true,
      },
      ['<Tab>'] = function (fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end,
      ['<S-Tab>'] = function (fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable( -1) then
          luasnip.jump( -1)
        else
          fallback()
        end
      end
    },
    sources = cmp.config.sources{
      { name = 'nvim_lsp' },
      { name = 'luasnip' },
      { name = 'path' },
      { name = 'buffer' },
    },
  }

  -- cmdline autocomplete
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

end

return M
