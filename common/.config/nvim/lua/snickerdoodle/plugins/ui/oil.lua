return {
    'stevearc/oil.nvim',
    event = "VimEnter",
    dependencies = {
        'echasnovski/mini.icons',
    },
    config = function()
        require('oil').setup({
        keymaps = {
            ["<C-s>"] = false,
            ["<C-h>"] = false,
            ["<C-t>"] = false,
            ["<C-p>"] = false,
            ["<C-c>"] = false,
            ["<C-l>"] = false,
        }
    })
        vim.keymap.set("n", "<leader>ee", "<cmd>Oil<CR>")
    end
}
