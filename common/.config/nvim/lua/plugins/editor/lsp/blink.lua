return {
    'saghen/blink.cmp',
    version = 'v1.3.*',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'xzbdmw/colorful-menu.nvim'
    },
    lazy = true,
    enabled = true,
    opts = {
        cmdline = {
            enaled = true,
            keymap = { preset = 'cmdline' },
            sources = function()
                local type = vim.fn.getcmdtype()
                if type == '/' or type == '?' then return { 'buffer' } end
                if type == ':' or type == '@' then return { 'cmdline' } end
                return {}
            end,
            completion = {
                trigger = {
                    show_on_blocked_trigger_characters = {},
                    show_on_x_blocked_trigger_characters = {},
                },
                list = {
                    selection = {
                        preselect = true,
                        auto_insert = true
                    }
                },
                menu = { auto_show = true },
                ghost_text = { enabled = true }
            }
        },
        appearance = {
            nerd_font_variant = 'mono',
            kind_icons = {
                Color = "██",
            }
        },
        completion = {
            keyword = {
                range = 'full'
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 300,
            },
            menu = {
                draw = {
                    columns = { { 'kind_icon' }, { 'label', gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require('colorful-menu').blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require('colorful-menu').blink_components_highlight(ctx)
                            end
                        }
                    }
                }
            }
        },
        keymap = {
            preset = 'default',
            ['<C-s>'] = { 'show_signature' }
        },
        signature = {
            enabled = true,
        },
        enabled = function()
            return not vim.tbl_contains({ "oil" }, vim.bo.filetype)
                and vim.bo.buftype ~= "prompt"
                and vim.b.completion ~= false
        end,
        fuzzy = { implementation = "prefer_rust_with_warning" },
        sources = {
            -- add lazydev to your completion providers
            default = { "lsp", "path", "snippets" },
            per_filetype = {
                lua = { "lazydev", inherit_defaults = true }
            },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100,
                },
            },
        },
    }
}
