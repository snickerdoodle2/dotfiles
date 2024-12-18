return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        'nvim-telescope/telescope.nvim',
    },
    cmd = "TodoTelescope",
    event = "LazyFile",
    keys = {
        { '<leader>ft', "<cmd>TodoTelescope<cr>", desc = 'Find TODO comments' },
    },
    opts = {}
}
