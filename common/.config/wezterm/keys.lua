---@diagnostic disable:assign-type-mismatch
local wezterm = require('wezterm')

---@type Action
---@diagnostic disable-next-line:undefined-field
local actions = wezterm.action

---@type Key[]
local keys = {
    {
        key = "c",
        mods = "SUPER",
        action = actions.CopyTo("Clipboard")
    },
    {
        key = "v",
        mods = "SUPER",
        action = actions.PasteFrom("Clipboard")
    },
    {
        key = "-",
        mods = "SUPER",
        action = actions.DecreaseFontSize
    },
    {
        key = "+",
        mods = "SUPER",
        action = actions.IncreaseFontSize
    },
    {
        key = "0",
        mods = "SUPER",
        action = actions.ResetFontSize
    },
    {
        key = "k",
        mods = "SUPER",
        action = actions.ClearScrollback("ScrollbackOnly")
    },
    {
        key = "f",
        mods = "SUPER",
        action = actions.Search({ CaseInSensitiveString = "" })
    }
}

return keys
