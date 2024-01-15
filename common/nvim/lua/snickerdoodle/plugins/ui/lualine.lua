return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
        'AndreM222/copilot-lualine',
        'f-person/git-blame.nvim'
    },
    event = 'VeryLazy',
    config = function()
        local git_blame = require('gitblame')
        git_blame.setup({
            display_virtual_text = false,
            message_template = '<author>, <date> • <summary>',
            date_format = '%r'
        })
        require('lualine').setup({
            options = {
                component_separators = {},
                disabled_filetypes = { 'dashboard' },
            },
            sections = {
                lualine_c = {
                    'filename',
                    { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
                },
                lualine_x = {
                    {
                        'copilot',
                        symbols = {
                            status = {
                                hl = {
                                    enabled = "#A6D189",
                                    disabled = "#e78284",
                                    warning = "#e5c890",
                                    unknown = "#949cbb"
                                },
                            }
                        },
                        show_colors = true
                    },
                    'filetype' },
                lualine_y = {},
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        })
    end
}
