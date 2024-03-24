return {
    "olexsmir/gopher.nvim",
    ft = "go",
    dependencies = { -- dependencies
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    build = function()
        vim.cmd([[silent! GoInstallDeps]])
    end,
    opts = {},
    config = function()
        vim.keymap.set("n", "<leader>lta", function()
            vim.ui.input({ prompt = "Tag name to add" }, function(input)
                vim.cmd("GoTagAdd " .. input)
            end)
        end, {})
        vim.keymap.set("n", "<leader>ltr", function()
            vim.ui.input({ prompt = "Tag name to remove" }, function(input)
                vim.cmd("GoTagRm " .. input)
            end)
        end, {})

        vim.keymap.set("n", "<leader>le", "<cmd> GoIfErr <CR>", {})
    end
}
