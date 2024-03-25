return {
    "L3MON4D3/LuaSnip",
    lazy = true,
    dependencies = { "rafamadriz/friendly-snippets" },
    config = function()
        local loader = require("luasnip.loaders.from_vscode")
        loader.lazy_load()
        loader.lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
    end
}
