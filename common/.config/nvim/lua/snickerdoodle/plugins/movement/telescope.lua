return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end, {}, mode = 'n', desc='Search files'},
        { '<leader>fs', function() require('telescope.builtin').live_grep() end, {}, mode = 'n', desc='Search a phrase'},
    },
    config = function()
        require('telescope').load_extension('fzf')
    end
}
