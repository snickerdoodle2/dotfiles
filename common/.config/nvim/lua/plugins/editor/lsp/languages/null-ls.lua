return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvimtools/none-ls-extras.nvim',
        'nvim-lua/plenary.nvim'
    },
    ft = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "vue",
        "svelte",
        "astro",
        "elixir",
    },
    opts = function()
        local null_ls = require('null-ls')
        local sources = {
            require('none-ls.diagnostics.eslint_d'),
            require('none-ls.code_actions.eslint_d'),
        }
        local add_cond = function(source, cond)
            if cond then
                table.insert(sources, source)
            end
        end

        add_cond(null_ls.builtins.diagnostics.credo,
            vim.bo.filetype == "elixir" and os.execute("mix credo --version > /dev/null 2>&1") == 0)

        return {
            sources = sources
        }
    end,
}
