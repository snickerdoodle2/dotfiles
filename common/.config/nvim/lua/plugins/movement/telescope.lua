return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            cond = function()
                return vim.fn.executable 'make' == 1
            end,
        },
        "debugloop/telescope-undo.nvim",
    },
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end,   {}, desc = 'Search files' },
        { '<leader>fs', function() require('telescope.builtin').live_grep() end,    {}, desc = 'Search a phrase' },
        { '<leader>u',  function() require('telescope').extensions.undo.undo() end, {}, desc = 'Undo tree' },
    },
    cmd = "Telescope",
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
                -- TODO: fix keybinds
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
