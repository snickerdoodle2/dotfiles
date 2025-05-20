local wezterm = require('wezterm')
---@type NerdFont
---@diagnostic disable-next-line:undefined-field
local nerdfonts = wezterm.nerdfonts

---@param window Window
---@return string
local get_leader = function(window)
    if window:leader_is_active() then
        return nerdfonts.md_lightning_bolt_circle
    else
        return nerdfonts.cod_circle
    end
end

---@param window Window
---@param pane Pane
local on_update_right_status = function(window, pane)
    ---@diagnostic disable-next-line:undefined-field
    local time = wezterm.strftime('%H:%M')
    local directory = pane:get_current_working_dir()
    if directory then
        ---@diagnostic disable-next-line:undefined-field
        directory = string.match(directory.path, "/(%w+)$")
    end
    local leader = get_leader(window)
    window:set_right_status(string.format("%s %s %s", time, directory, leader))
end

---@diagnostic disable-next-line:undefined-field
wezterm.on('update-right-status', on_update_right_status)
