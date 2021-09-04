return function()
    local cmp = require('cmp')
    cmp.setup {
        completion = {
            completeopt = "menuone,noselect",
        },
        mapping = {
            ['<C-d>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.close(),
            ['<CR>'] = cmp.mapping.confirm({
                behavior = cmp.ConfirmBehavior.Replace,
                select = true,
            })
        },
            snippet = {
      expand = function(args)
        require'luasnip'.lsp_expand(args.body)
      end
    },
        sources = {
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'luasnip'},
            { name = 'nvim_lua' },
            { name = 'tabnine' },
            { name = 'path' },
            { name = 'neorg' },
        },
    }
end
