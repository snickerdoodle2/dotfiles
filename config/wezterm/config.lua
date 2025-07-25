require("updates")

local wezterm = require("wezterm")
local colors = require("colors")
local keys = require("keys")
local mux = require("mux")
local program = require("program")

---@type Config
---@diagnostic disable-next-line: undefined-field
local config = wezterm.config_builder()

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

---@diagnostic disable-next-line: assign-type-mismatch
config.window_close_confirmation = "NeverPrompt"

---@diagnostic disable-next-line: undefined-field
config.font = wezterm.font_with_fallback({
    { family = "Berkeley Mono",     weight = "Medium" },
    { family = "Apple Color Emoji", assume_emoji_presentation = true },
})

config.color_schemes = colors.color_schemes
config.color_scheme = colors.color_scheme()
config.inactive_pane_hsb = colors.inactive_pane_hsb()

config.disable_default_key_bindings = true
config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }
config.keys = keys

config.unix_domains = mux.unix_domains
config.default_gui_startup_args = mux.default_gui_startup_args
config.default_workspace = mux.default_workspace
config.default_prog = program.default_prog

return config
