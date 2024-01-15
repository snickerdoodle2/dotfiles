return {
    {
        'simrat39/rust-tools.nvim',
        event = { "BufReadPre", "BufNewFile" },
        enabled = true,
        dependencies = {
            { 'neovim/nvim-lspconfig' }, -- Required
        },
        config = function()
            local rt = require("rust-tools")
            rt.setup({
                server = {
                    on_attach = function(_, _)
                        rt.inlay_hints.enable()
                    end,
                },
            })
        end
    }
}
