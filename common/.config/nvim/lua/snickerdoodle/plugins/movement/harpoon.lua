return {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    keys = {
        { '<leader>a', function() require('harpoon'):list():add() end, mode = 'n', desc='Mark file'},
        { '<C-e>', function() require('harpoon').ui:toggle_quick_menu(require('harpoon'):list()) end, mode = 'n', desc='Show marked files'},
        { '<C-h>', function() require('harpoon'):list():select(1) end, mode = 'n', desc='Jump to file no. 1'},
        { '<C-j>', function() require('harpoon'):list():select(2) end, mode = 'n', desc='Jump to file no. 2'},
        { '<C-k>', function() require('harpoon'):list():select(3) end, mode = 'n', desc='Jump to file no. 3'},
        { '<C-l>', function() require('harpoon'):list():select(4) end, mode = 'n', desc='Jump to file no. 4'}
    },
    opts = {
            default = {
                select = function(list_item, list, options)
                    local _ = list
                    options = options or {}
                    if list_item == nil then
                        return
                    end

                    local bufnr = vim.fn.bufnr(list_item.value)
                    local set_position = false
                    if bufnr == -1 then
                        set_position = true
                        bufnr = vim.fn.bufnr(list_item.value, true)
                    end
                    if not vim.api.nvim_buf_is_loaded(bufnr) then
                        vim.fn.bufload(bufnr)
                        vim.api.nvim_set_option_value('buflisted', true, {
                            buf = bufnr,
                        })
                    end

                    if options.vsplit then
                        vim.cmd('vsplit')
                    elseif options.split then
                        vim.cmd('split')
                    elseif options.tabedit then
                        vim.cmd('tabedit')
                    end

                    vim.api.nvim_set_current_buf(bufnr)

                    if list_item.value:find('^oil://') ~= nil then
                        vim.api.nvim_win_set_cursor(0, { 1, 10 })
                        return
                    end

                    if set_position then
                        vim.api.nvim_win_set_cursor(0, {
                            list_item.context.row or 1,
                            list_item.context.col or 0,
                        })
                    end
                end,
            }
    }
}
