return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        { '<leader>goB', function() Snacks.gitbrowse() end,      desc = 'Browse git' },
        { '<leader>gb',  function() Snacks.git.blame_line() end, desc = 'Git Logs on current line' },
        { '<leader>s.',  function() Snacks.scratch() end,        desc = 'Toggle Scratch Buffer' },
        { '<leader>ss',  function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer' },
    },
    opts = {
        bigfile = {
            enable = true,
        },
        dashboard = {
            preset = {
                keys = {
                    { action = ":Telescope find_files", desc = "Find file", icon = "󱙓 ", key = "f" },
                    { action = ":lua Snacks.scratch()", desc = "Scratch file", icon = "󰎚 ", key = "n" },
                    { action = ":Telescope live_grep", desc = "Find text", icon = " ", key = "s" },
                    { action = ":TodoTelescope", desc = "Find TODOS", icon = "󰄸 ", key = "t" },
                    { action = ":lua _lazygit_toggle()", desc = "Open git", icon = " ", key = "g" },
                    { action = ":Lazy", desc = "Lazy", icon = "󰒲 ", key = "l" },
                    { action = ":qa", desc = "Quit", icon = " ", key = "q" },
                },
            },
            sections = {
                {
                    { section = "keys",   gap = 1, padding = 1 },
                    { section = "startup" }
                },
                {
                    section = "terminal",
                    -- TODO: change this
                    cmd = vim.fn.stdpath('config') ..
                        "/static/pokemon-colorscripts/pokemon-colorscripts.py -r --no-title --shiny; sleep .1",
                    random = 10,
                    pane = 2,
                    indent = 10,
                    height = 28,
                },
            },
        },
        indent = {
            animate = { enabled = false },
        },
        quickfile = {},
        notifier = {}
    },
}
