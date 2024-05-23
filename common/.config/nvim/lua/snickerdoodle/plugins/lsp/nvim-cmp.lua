return {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
        {
            'onsails/lspkind.nvim',
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "L3MON4D3/LuaSnip",
            "zbirenbaum/copilot.lua",
        },
    },
    config = function()
        -- And you can configure cmp even more, if you want to.
        local cmp = require('cmp')

        cmp.setup({
            formatting = {
                format = require('lspkind').cmp_format({
                    mode = "symbol_text",
                    symbol_map = {
                        Copilot = "",
                    }
                })
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            },
            mapping = {
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-n>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
                ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
                ['<C-u>'] = cmp.mapping.scroll_docs(-4),
                ['<C-d>'] = cmp.mapping.scroll_docs(4),
                ['<Esc>'] = cmp.mapping.abort()
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = 'copilot' },
                { name = 'crates' }
            }
        })
    end
}
