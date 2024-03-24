return {
    'stevearc/oil.nvim',
    event = "VimEnter",
    opts = {
        keymaps = {
            ["g?"] = "actions.show_help",
            ["<CR>"] = "actions.select",
            ["<C-s>"] = false,
            ["<C-h>"] = false,
            ["<C-t>"] = false,
            ["<C-p>"] = false,
            ["<C-c>"] = false,
            ["<C-l>"] = false,
            ["-"] = "actions.parent",
            ["_"] = "actions.open_cwd",
            ["`"] = "actions.cd",
            ["~"] = "actions.tcd",
            ["gs"] = "actions.change_sort",
            ["gx"] = "actions.open_external",
            ["g."] = "actions.toggle_hidden",
            ["g\\"] = "actions.toggle_trash",
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
