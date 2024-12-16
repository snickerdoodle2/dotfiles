return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "LazyFile",
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    opts = {
        highlight = { enable = true },
        indent = { enable = true },
        sync_install = false,
        auto_install = true,
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "javascript",
            "jsdoc",
            "json",
            "jsonc",
            "lua",
            "luadoc",
            "luap",
            "markdown",
            "markdown_inline",
            "printf",
            "python",
            "query",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },
        -- TODO: incremental selection
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
