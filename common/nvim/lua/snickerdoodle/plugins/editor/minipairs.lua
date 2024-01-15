return {
    'echasnovski/mini.pairs',
    event = 'InsertEnter',
    version = '*',
    enabled = false,
    config = function()
        require('mini.pairs').setup()
    end
}
