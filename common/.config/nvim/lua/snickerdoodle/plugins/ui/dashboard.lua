return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } },
    opts = function()
        local opts = {
            theme = 'doom',
            config = {
                center = {
                    { action = "Telescope find_files", desc = " Find file", icon = "󱙓 ", key = "f" },
                    { action = "ene | startinsert", desc = " New file", icon = "󰎚 ", key = "n" },
                    { action = "Telescope live_grep", desc = " Find text", icon = " ", key = "s" },
                    { action = "TodoTelescope", desc = " Find TODOS", icon = "󰄸 ", key = "t" },
                    { action = "lua _lazygit_toggle()", desc = " Open git", icon = " ", key = "g" },
                    { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
                    { action = "qa", desc = " Quit", icon = " ", key = "q" },
                },
                footer = {}
            },
            preview = {
                command = 'chafa --passthrough tmux --clear --fg-only -s 55 --symbols braille',
                file_path = os.getenv("HOME") .. '/.config/nvim/static/shinji.gif',
                file_height = 15,
                file_width = 55,
            }
        }

        for _, button in ipairs(opts.config.center) do
            button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
            button.key_format = "  %s"
        end

        if vim.o.filetype == "lazy" then
            vim.cmd.close()
            vim.api.nvim_create_autocmd("User", {
                pattern = "DashboardLoaded",
                callback = function()
                    require("lazy").show()
                end,
            })
        end

        return opts
    end,
}
