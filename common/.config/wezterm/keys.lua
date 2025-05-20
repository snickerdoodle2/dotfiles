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
    },
    {
        key = 'q',
        mods = 'CMD',
        action = actions.QuitApplication
    },
    {
        key = "l",
        mods = "CTRL|LEADER",
        action = actions.ShowDebugOverlay
    },
    {
        key = "c",
        mods = "LEADER",
        action = actions.SpawnTab("CurrentPaneDomain")
    },
    {
        key = "\\",
        mods = "LEADER",
        action = actions.SplitHorizontal({ domain = "CurrentPaneDomain" })
    },
    {
        key = "-",
        mods = "LEADER",
        action = actions.SplitVertical({ domain = "CurrentPaneDomain" })
    },
    {
        key = "x",
        mods = "LEADER",
        action = actions.CloseCurrentPane({ confirm = true })
    },
    {
        key = "&",
        mods = "LEADER|SHIFT",
        action = actions.CloseCurrentTab({ confirm = true })
    },
    {
        key = "n",
        mods = "LEADER",
        action = actions.ActivateTabRelative(1)
    }
}

for i = 1, 10 do
    table.insert(keys, {
        key = tostring(i % 10),
        mods = "LEADER",
        action = actions.ActivateTab(i - 1)
    })
end

return keys
