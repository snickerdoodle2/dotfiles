return {
    'saghen/blink.cmp',
    version = 'v1.3.*',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'xzbdmw/colorful-menu.nvim',
        'echasnovski/mini.icons',
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
        },
        completion = {
            keyword = {
                range = 'full'
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 300,
                window = {
                    border = 'single'
                }
            },
            menu = {
                draw = {
                    columns = { { 'kind_icon' }, { 'label', gap = 1 } },
                    components = {
                        kind_icon = {
                            width = { min = 2 },
                            text = function(ctx)
                                if ctx.kind == "Color" then
                                    return "██"
                                end
                                local kind_icon, _, _ = require('mini.icons').get('lsp', ctx.kind)
                                return kind_icon
                            end,
                            highlight = function(ctx)
                                if ctx.kind == "Color" then
                                    return ctx.kind_hl
                                end
                                local _, hl, _ = require('mini.icons').get('lsp', ctx.kind)
                                return hl
                            end
                        },
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
            window = {
                border = 'single'
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
