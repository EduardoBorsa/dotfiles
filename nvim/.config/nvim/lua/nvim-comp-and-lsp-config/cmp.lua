vim.g.completeopt = "menu,menuone,noselect,noinsert"
local cmp = require('cmp')
local lspkind = require('lspkind')

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end
  },
  formatting = {format = lspkind.cmp_format({with_text = true, maxwidth = 50})},
  mapping = cmp.mapping.preset.insert({
    ["<C-n>"] = cmp.mapping.select_next_item {behavior = cmp.SelectBehavior.Insert},
    ["<C-p>"] = cmp.mapping.select_prev_item {behavior = cmp.SelectBehavior.Insert},
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-e>"] = cmp.mapping.abort(),
    ["<C-Space>"] = cmp.mapping.complete(),
    -- ["<CR>"] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace, select = true},
    ["<CR>"] = cmp.mapping.confirm {behavior = cmp.ConfirmBehavior.Replace},
    ["<c-y>"] = cmp.mapping(cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true
    }, {"i", "c"}),
    ["<c-space>"] = cmp.mapping {
      i = cmp.mapping.complete(),
      c = function(_ --[[fallback]] )
        if cmp.visible() then
          if not cmp.confirm {select = true} then return end
        else
          cmp.complete()
        end
      end
    },
    ["<tab>"] = cmp.config.disable
  }),
  sources = cmp.config.sources({
    {name = "nvim_lsp"}, {name = "luasnip"}, {name = "buffer"}, {name = "nvim_lua"}, {name = "path"}
  })
})
