return {
    'stevearc/conform.nvim',
    event = "LazyFile",
    opts = {
        format_on_save = {
            timeout_ms = 500,
            lsp_fallback = true,
        },
        formatters_by_ft = {
            nix = { "alejandra" }
        },
    },
    keys = {
        { '<F3>', function() require('conform').format({ lsp_fallback = true, timeout_ms = 500 }) end, desc = 'Format buffer' },
    }
}
