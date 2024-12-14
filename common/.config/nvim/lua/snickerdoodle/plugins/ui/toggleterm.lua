return {
    'akinsho/toggleterm.nvim',
    version = "*",
    event = 'VeryLazy',
    config = function()
        require('toggleterm').setup()

        local terminal = require('toggleterm.terminal').Terminal
        local lazygit = terminal:new({ cmd = "lazygit", hidden = true, direction = 'float' })
        vim.keymap.set('n', '<leader>gg', function()
            lazygit:toggle()
        end, { desc = "Open Lazygit" })
    end
}
