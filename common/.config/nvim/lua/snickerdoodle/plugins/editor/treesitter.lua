return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "LazyFile",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "rust" },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
        })
    end
}
