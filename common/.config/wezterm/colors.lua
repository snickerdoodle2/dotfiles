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

wezterm.log_info(wezterm.color.get_builtin_schemes()['Gruvbox'])

return M
