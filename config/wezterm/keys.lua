---@diagnostic disable:assign-type-mismatch
local wezterm = require("wezterm")
local mux = require("mux")

---@type Action
---@diagnostic disable-next-line:undefined-field
local actions = wezterm.action

---@type Key[]
local keys = {
    {
        key = "c",
        mods = "SUPER",
        action = actions.CopyTo("Clipboard"),
    },
    {
        key = "c",
        mods = "CTRL|SHIFT",
        action = actions.CopyTo("Clipboard"),
    },
    {
        key = "v",
        mods = "SUPER",
        action = actions.PasteFrom("Clipboard"),
    },
    {
        key = "v",
        mods = "CTRL|SHIFT",
        action = actions.PasteFrom("Clipboard"),
    },
    {
        key = "-",
        mods = "SUPER",
        action = actions.DecreaseFontSize,
    },
    {
        key = "_",
        mods = "CTRL|SHIFT",
        action = actions.DecreaseFontSize,
    },
    {
        key = "+",
        mods = "SUPER",
        action = actions.IncreaseFontSize,
    },
    {
        key = "+",
        mods = "CTRL|SHIFT",
        action = actions.IncreaseFontSize,
    },
    {
        key = "0",
        mods = "SUPER",
        action = actions.ResetFontSize,
    },
    {
        key = ")",
        mods = "CTRL|SHIFT",
        action = actions.ResetFontSize,
    },
    {
        key = "k",
        mods = "SUPER",
        action = actions.ClearScrollback("ScrollbackOnly"),
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = actions.ClearScrollback("ScrollbackOnly"),
    },
    {
        key = "f",
        mods = "SUPER",
        action = actions.Search({ CaseInSensitiveString = "" }),
    },
    {
        key = "f",
        mods = "CTRL|SHIFT",
        action = actions.Search({ CaseInSensitiveString = "" }),
    },
    {
        key = "q",
        mods = "CMD",
        action = actions.QuitApplication,
    },
    {
        key = "h",
        mods = "CMD",
        action = actions.ActivatePaneDirection("Left"),
    },
    {
        key = "h",
        mods = "CTRL|SHIFT",
        action = actions.ActivatePaneDirection("Left"),
    },
    {
        key = "j",
        mods = "CMD",
        action = actions.ActivatePaneDirection("Down"),
    },
    {
        key = "j",
        mods = "CTRL|SHIFT",
        action = actions.ActivatePaneDirection("Down"),
    },
    {
        key = "k",
        mods = "CMD",
        action = actions.ActivatePaneDirection("Up"),
    },
    {
        key = "k",
        mods = "CTRL|SHIFT",
        action = actions.ActivatePaneDirection("Up"),
    },
    {
        key = "l",
        mods = "CMD",
        action = actions.ActivatePaneDirection("Right"),
    },
    {
        key = "l",
        mods = "CTRL|SHIFT",
        action = actions.ActivatePaneDirection("Right"),
    },
    {
        key = "LeftArrow",
        mods = "CMD",
        action = actions.ActivatePaneDirection("Left"),
    },
    {
        key = "LeftArrow",
        mods = "CTRL",
        action = actions.ActivatePaneDirection("Left"),
    },
    {
        key = "DownArrow",
        mods = "CMD",
        action = actions.ActivatePaneDirection("Down"),
    },
    {
        key = "DownArrow",
        mods = "CTRL",
        action = actions.ActivatePaneDirection("Down"),
    },
    {
        key = "UpArrow",
        mods = "CMD",
        action = actions.ActivatePaneDirection("Up"),
    },
    {
        key = "UpArrow",
        mods = "CTRL",
        action = actions.ActivatePaneDirection("Up"),
    },
    {
        key = "RightArrow",
        mods = "CMD",
        action = actions.ActivatePaneDirection("Right"),
    },
    {
        key = "RightArrow",
        mods = "CTRL",
        action = actions.ActivatePaneDirection("Right"),
    },
    {
        key = "l",
        mods = "CTRL|LEADER",
        action = actions.ShowDebugOverlay,
    },
    {
        key = "c",
        mods = "LEADER",
        action = actions.SpawnTab("CurrentPaneDomain"),
    },
    {
        key = "\\",
        mods = "LEADER",
        action = actions.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "-",
        mods = "LEADER",
        action = actions.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
        key = "x",
        mods = "LEADER",
        action = actions.CloseCurrentPane({ confirm = true }),
    },
    {
        key = "&",
        mods = "LEADER|SHIFT",
        action = actions.CloseCurrentTab({ confirm = true }),
    },
    {
        key = "n",
        mods = "LEADER",
        action = actions.ActivateTabRelative(1),
    },
    {
        key = "z",
        mods = "LEADER",
        action = actions.TogglePaneZoomState,
    },
    {
        key = "o",
        mods = "LEADER",
        ---@diagnostic disable-next-line:undefined-field
        action = wezterm.action_callback(mux.sessionizer),
    },
    {
        key = "$",
        mods = "LEADER|SHIFT",
        ---@diagnostic disable-next-line:undefined-field
        action = wezterm.action_callback(mux.rename),
    },
    {
        key = "p",
        mods = "SUPER|SHIFT",
        action = actions.ShowLauncher,
    },
    {
        key = "p",
        mods = "CTRL|SHIFT",
        action = actions.ShowLauncher,
    },
}

for i = 1, 10 do
    table.insert(keys, {
        key = tostring(i % 10),
        mods = "LEADER",
        action = actions.ActivateTab(i - 1),
    })
end

return keys
