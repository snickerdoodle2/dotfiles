return {
    "folke/flash.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local flash = require('flash')
        flash.setup({})

        vim.keymap.set({ 'n', 'o' }, 's', function() flash.jump() end, {})
        vim.keymap.set({ 'n', 'o' }, 'S', function() flash.treesitter() end, {})
    end
}
