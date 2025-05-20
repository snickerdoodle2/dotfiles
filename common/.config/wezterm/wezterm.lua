local wezterm = require 'wezterm'

---@type Config
---@diagnostic disable-next-line: undefined-field
local config = wezterm.config_builder()

config.color_scheme = 'Kanagawa (Gogh)'

config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true

---@diagnostic disable-next-line: assign-type-mismatch
config.window_close_confirmation = 'NeverPrompt'

---@diagnostic disable-next-line: undefined-field
config.font = wezterm.font_with_fallback({
    { family = "Berkeley Mono",     weight = 'Medium' },
    { family = "Apple Color Emoji", assume_emoji_presentation = true }
})
config.font_size = 15.0

return config
