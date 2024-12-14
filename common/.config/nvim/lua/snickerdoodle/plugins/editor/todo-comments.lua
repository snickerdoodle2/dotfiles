return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope.nvim',
    },
    keys = {
        { '<leader>ft', "<cmd>TodoTelescope<cr>", mode = 'n', desc = 'Find TODO comments' },
    },
    opts = {}
}
