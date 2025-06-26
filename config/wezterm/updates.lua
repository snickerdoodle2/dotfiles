local wezterm = require("wezterm")
local helpers = require("helpers")
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
local update_left_status = function(window, _)
	local leader = get_leader(window)
	window:set_left_status(string.format(" %s  %s ", leader, window:active_workspace()))
end

---@param window Window
---@param pane Pane
local update_right_status = function(window, pane)
	---@diagnostic disable-next-line:undefined-field
	local time = wezterm.strftime("%H:%M")
	local directory = pane:get_current_working_dir()
	if directory then
		---@diagnostic disable-next-line:undefined-field
		directory = helpers.basename(directory.path)
	end
	window:set_right_status(string.format(" %s %s ", time, directory))
end

---@param window Window
---@param pane Pane
local update_status = function(window, pane)
	update_left_status(window, pane)
	update_right_status(window, pane)
end

---@diagnostic disable-next-line:undefined-field
wezterm.on("update-status", update_status)
