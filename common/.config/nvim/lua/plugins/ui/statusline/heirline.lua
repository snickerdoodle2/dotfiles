local show_statusline = function()
    local disabled_ft = {
        ["oil"] = true
    }
    return disabled_ft[vim.bo.filetype] == nil
end

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
                {
                    condition = show_statusline,
                    require('plugins.ui.statusline.components.git'),
                    require('plugins.ui.statusline.components.diagnostics'),
                    require('plugins.ui.statusline.components.file'),
                    { provider = "%=" },
                    require('plugins.ui.statusline.components.search_count'),
                    require('plugins.ui.statusline.components.macro'),
                }
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
