return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
    event = "LazyFile",
    init = function(plugin)
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    opts = {
        highlight = { enable = true, disable = { "csv" } },
        indent = { enable = true },
        sync_install = false,
        auto_install = true,
        ignore_install = { "csv" },
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
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "<C-m>",
                node_incremental = "<C-m>",
                scope_incremental = false,
                node_decremental = "<bs>",
            },
        },
        textobjects = {
            move = {
                enable = true,
                goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
                goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
                goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
                goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
            },
        },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end
}
