return {
    'saghen/blink.cmp',
    dependencies = {
        "L3MON4D3/LuaSnip"
    },
    version = 'v0.*',
    lazy = true,
    opts = {
        snippets = {
            expand = function(snippet) require('luasnip').lsp_expand(snippet) end,
            active = function(filter)
                if filter and filter.direction then
                    return require('luasnip').jumpable(filter.direction)
                end
                return require('luasnip').in_snippet()
            end,
            jump = function(direction) require('luasnip').jump(direction) end,
        },
        sources = {
            completion = {
                enabled_providers = { "lsp", "path", "luasnip", "buffer", "lazydev" },
            },
            providers = {
                lsp = { fallback_for = { "lazydev" } },
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
            },
        },
    }
}
