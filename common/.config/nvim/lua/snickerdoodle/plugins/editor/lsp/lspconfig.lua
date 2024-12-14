return {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        { 'j-hui/fidget.nvim', opts = {} },
        'saghen/blink.cmp'
    },
    config = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
            callback = function(event)
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- TODO: TELESCOPE??
                map('gd', vim.lsp.buf.definition, '[G]oto [d]efinition')
                map('K', vim.lsp.buf.hover, 'Hover')
                map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclarations')
                map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
                map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
                map('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinitions')
                -- map('<leader>ds', document_symbols, '[D]ocument [Symbols]')
                -- map('<leader>ws', workspace_symbols, '[W]orkspace [Symbols]')
                map('<C-s>', vim.lsp.buf.signature_help, '[S]ignature Help')
                map('<F2>', vim.lsp.buf.rename, 'Rename')
                map('<F4>', vim.lsp.buf.code_action, 'Code Actions')
            end
        })

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('blink.cmp').get_lsp_capabilities())

        local servers = {
            lua_ls = {
                -- cmd = { ... },
                -- filetypes = { ... },
                -- capabilities = {},
                settings = {
                    Lua = {
                        completion = {
                            callSnippet = 'Replace',
                        },
                        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                        -- diagnostics = { disable = { 'missing-fields' } },
                    },
                },
            },
        }
        local ensure_installed = vim.tbl_keys(servers or {})
        local lspconfig = require('lspconfig')

        local setup_local = function (server_name, server)
            server = server or {}
            server.capabilities = vim.tbl_extend('force', {}, capabilities, server.capabilities or {})
            lspconfig[server_name].setup(server)
        end

        setup_local('rust_analyzer')

        -- Installed locally

        require('mason-lspconfig').setup {
            ensure_installed = ensure_installed,
            handlers = {
                function(server_name)
                    local server = servers[server_name] or {}
                    server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
                    lspconfig[server_name].setup(server)
                end,
            },
        }
    end,
}
