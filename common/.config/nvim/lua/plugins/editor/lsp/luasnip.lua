return {
    "L3MON4D3/LuaSnip",
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    lazy = true,
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    dependencies = {
        "rafamadriz/friendly-snippets"
    },
    cond = function()
        return vim.fn.executable 'make' == 1
    end,
    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
