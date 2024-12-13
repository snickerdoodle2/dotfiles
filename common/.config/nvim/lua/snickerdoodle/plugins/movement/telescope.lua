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
        telescope.load_extension('fzf')
        telescope.load_extension('undo')
    end
}
