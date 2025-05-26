local wezterm = require('wezterm')

M = {}

---@diagnostic disable:undefined-field
M.color_scheme = function()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

---@type Palette
local dark = wezterm.color.get_builtin_schemes()['Catppuccin Mocha']
dark.background = 'black'

M.color_schemes = {
    ["Dark"] = dark,
    ["Light"] = wezterm.color.get_builtin_schemes()['Catppuccin Latte'],
}


M.inactive_pane_hsb = function()
    if M.color_scheme() == "Dark" then
        return {
            saturation = 0.4,
            brightness = 0.2,
        }
    else
        return {
            saturation = 1,
            brightness = 0.7,
        }
    end
end
return M
