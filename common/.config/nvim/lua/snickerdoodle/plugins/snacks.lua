return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        { '<leader>gB', function() Snacks.gitbrowse() end, desc = 'Browse git' },
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
                    cmd = vim.fn.stdpath('config') ..
                        "/static/pokemon-colorscripts/pokemon-colorscripts.py -r --no-title --shiny",
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
    },
}
