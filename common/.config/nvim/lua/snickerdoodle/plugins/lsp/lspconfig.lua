return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        'williamboman/mason.nvim',
        "Fildo7525/pretty_hover",
        { "folke/neodev.nvim", opts = {} },
        { "j-hui/fidget.nvim", opts = {} }
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }

                local pretty_hover = require("pretty_hover")
                pretty_hover.setup({})

                vim.lsp.inlay_hint.enable(true)
                vim.keymap.set('n', 'K', pretty_hover.hover, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
            end
        })

        function Merge(t1, t2)
            if (type(t2) == "table") then
                for k, v in pairs(t2) do
                    if (type(v) == "table") and (type(t1[k] or false) == "table") then
                        Merge(t1[k], t2[k])
                    else
                        t1[k] = v
                    end
                end
            end
            return t1
        end

        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local default_setup = function(server, additional)
            require('lspconfig')[server].setup(Merge({
                capabilities = lsp_capabilities,
            }, additional))
        end

        default_setup('biome', {
            cmd = { "bunx", "biome" }
        })

        default_setup('templ')


        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                default_setup,
                lua_ls = function()
                    default_setup('lua_ls', {
                        settings = {
                            Lua = {
                                completion = {
                                    callSnippet = "Replace"
                                }
                            }
                        }
                    })
                end,
                html = function()
                    default_setup('html', {
                        filetypes = { "html", "templ" },
                    })
                end,
                htmx = function()
                    default_setup('htmx', {
                        filetypes = { "html", "templ" },
                    })
                end,
                tailwindcss = function()
                    default_setup('tailwindcss', {
                        filetypes = { "html", "templ", "astro", "javascript", "typescript", "react" },
                        settings = {
                            tailwindCSS = {
                                includeLanguages = {
                                    templ = "html",
                                },
                            },
                        },
                    })
                end
            },
        })
    end
}
