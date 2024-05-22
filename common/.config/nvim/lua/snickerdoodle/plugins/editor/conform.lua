return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    opts = {
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
    }
}
