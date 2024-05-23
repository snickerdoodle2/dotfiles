return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require('conform')
        conform.setup({
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                svelte = { "biome" },
                typescript = { "biome" },
                javascript = { "biome" },
            }
        })

        vim.keymap.set("n", "<F3>", function() conform.format({ lsp_fallback = true, timeout_ms = 500 }) end, {})
    end
}
