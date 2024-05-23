return {
    'echasnovski/mini.surround',
    event = { "BufReadPre", "BufNewFile" },
    version = '*',
    enabled = false,
    config = function()
        require('mini.surround').setup()
    end
}
