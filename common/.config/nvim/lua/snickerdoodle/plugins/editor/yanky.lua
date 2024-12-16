return {
    'gbprod/yanky.nvim',
    opts = {
        highlight = {
            timer = 150,
        },
    },
    config = function(_, opts)
        require("yanky").setup(opts)
        require("telescope").load_extension("yank_history")
    end,
    keys = {
        { "<leader>p", "<cmd>Telescope yank_history<cr>", desc = "Show Yank History" },
        { "y",         "<Plug>(YankyYank)",               mode = { "n", "x" },                          desc = "Tank Text" },
        { "p",         "<Plug>(YankyPutAfter)",           mode = { "n", "x" },                          desc = "Put Text After Cursor" },
        { "P",         "<Plug>(YankyPutBefore)",          mode = { "n", "x" },                          desc = "Put Text Before Cursor" },
        { "gp",        "<Plug>(YankyGPutAfter)",          mode = { "n", "x" },                          desc = "Put Text After Cursor (Cursor after new text)" },
        { "gP",        "<Plug>(YankyGPutBefore)",         mode = { "n", "x" },                          desc = "Put Text Before (Cursor after new text)" },
        { "<c-p>",     "<Plug>(YankyPreviousEntry)",      desc = "Cycle Yank History to Previous Entry" },
        { "<c-n>",     "<Plug>(YankyNextEntry)",          desc = "Cycle Yank History to Next Entry" }
    }
}
