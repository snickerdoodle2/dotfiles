return {
    'saghen/blink.cmp',
    dependencies = {
        "L3MON4D3/LuaSnip"
    },
    version = 'v0.9.*',
    lazy = true,
    enabled = true,
    opts = {
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
            kind_icons = {
                Color = "██",
            }
        },
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
            -- add lazydev to your completion providers
            default = { "lazydev", "lsp", "path", "luasnip", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
        completion = {
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 300,
            },
        },
    }
}
