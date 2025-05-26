return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
        background = {
            light = "latte",
            dark = "mocha"
        },
        color_overrides = {
            mocha = {
                base = "#000000"
            }
        },
        integrations = {
            blink_cmp = true
        }
    }
}
