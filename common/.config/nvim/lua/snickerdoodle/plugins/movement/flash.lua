return {
    "folke/flash.nvim",
    opts = {
        label = {
            rainbow = {
                enabled = true,
                shade = 9
            }
        }
    },
    keys = {
        { "s", function() require('flash').jump() end,       { 'n', 'o' }, desc = "Flash Jump" },
        { "S", function() require('flash').treesitter() end, { 'n', 'o' }, desc = "Flash Treesitter" },
    }
}
