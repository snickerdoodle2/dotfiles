return {
    "rebelot/heirline.nvim",
    dependencies = {
        'echasnovski/mini.icons',
    },
    event = "VeryLazy",
    config = function()
        local palletes = require('catppuccin.palettes')
        local heirline = require('heirline')
        local utils = require('heirline.utils')
        heirline.load_colors(palletes.get_palette())
        heirline.setup({
            statusline = {
                require('plugins.ui.statusline.components.vimode'),
                require('plugins.ui.statusline.components.git'),
                require('plugins.ui.statusline.components.diagnostics'),
                require('plugins.ui.statusline.components.file'),
            },
        })

        vim.api.nvim_create_augroup("Heirline", { clear = true })
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                utils.on_colorscheme(palletes.get_palette)
            end,
            group = "Heirline",
        })
    end
}
