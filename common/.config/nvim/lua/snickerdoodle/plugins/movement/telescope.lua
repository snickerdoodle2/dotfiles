return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
        "debugloop/telescope-undo.nvim",
    },
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end, {}, mode = 'n', desc='Search files'},
        { '<leader>fs', function() require('telescope.builtin').live_grep() end, {}, mode = 'n', desc='Search a phrase'},
        { '<leader>u', function() require('telescope').extensions.undo.undo() end, {}, mode = 'n', desc='Undo tree'},
    },
    config = function()
        local telescope = require('telescope')
        telescope.setup({
            defaults = {
                layout_config = {
                    horizontal = {
                        width = 0.9,
                    }
                }
            },
            extensions = {
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.6,
                        preview_cutoff = 0,
                        height = 0.99,
                    },
                }
            }
        })
        telescope.load_extension('fzf')
        telescope.load_extension('undo')
    end
}
