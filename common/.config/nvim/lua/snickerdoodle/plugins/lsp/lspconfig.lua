return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        'williamboman/mason.nvim',
        { "folke/neodev.nvim", opts = {} },
        { "j-hui/fidget.nvim", opts = {} }
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', '<F2>', vim.lsp.buf.rename, opts)
                vim.keymap.set({ 'n', 'x' }, '<F3>',
                    function() vim.lsp.buf.format({ async = true, timeout = 1000 }) end,
                    opts
                )
                vim.keymap.set('n', '<F4>', vim.lsp.buf.code_action, opts)
            end
        })

        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local default_setup = function(server)
            require('lspconfig')[server].setup({
                capabilities = lsp_capabilities,
            })
        end

        require('mason-lspconfig').setup({
            ensure_installed = {},
            handlers = {
                default_setup,
                lua_ls = function()
                    require('lspconfig').lua_ls.setup({
                        settings = {
                            Lua = {
                                completion = {
                                    callSnippet = "Replace"
                                }
                            }
                        }
                    })
                end
            },
        })
    end
}
