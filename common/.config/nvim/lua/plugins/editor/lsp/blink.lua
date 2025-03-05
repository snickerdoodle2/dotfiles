return {
    'saghen/blink.cmp',
    version = 'v0.13.*',
    dependencies = 'rafamadriz/friendly-snippets',
    lazy = true,
    enabled = true,
    opts = {
        appearance = {
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
        fuzzy = { implementation = "prefer_rust_with_warning" },
        sources = {
            -- add lazydev to your completion providers
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
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
