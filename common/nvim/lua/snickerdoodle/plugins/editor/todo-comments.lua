return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    event = "VeryLazy",
    config = function()
        require('todo-comments').setup()
        vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>")
    end
}
