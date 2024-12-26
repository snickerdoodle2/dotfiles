return {
    'saghen/blink.cmp',
    dependencies = {
        "L3MON4D3/LuaSnip"
    },
    version = 'v0.*',
    lazy = true,
    opts = {
        enabled = function()
            return not vim.tbl_contains({ "oil" }, vim.bo.filetype)
                and vim.bo.buftype ~= "prompt"
                and vim.b.completion ~= false
        end,
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
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 300,
            }
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
            kind_icons = {
                Color = "██",
            }
        },
    }
}
