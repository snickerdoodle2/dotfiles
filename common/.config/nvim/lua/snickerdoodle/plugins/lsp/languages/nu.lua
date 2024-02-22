return {
    "LhKipp/nvim-nu",
    event = { "BufReadPre *.nu", "BufNewFile *.nu" },
    dependencies = {
        "nvimtools/none-ls.nvim"
    },
    opts = {}
}
