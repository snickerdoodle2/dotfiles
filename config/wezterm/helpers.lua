local wezterm = require("wezterm")
local M = {}

---@param path String
M.basename = function(path)
	path = string.gsub(path, "/?$", "")
	return string.gsub(path, "(.*[/\\])(.*)", "%2")
end

---@param command string
---@return string
M.run = function(command)
	local file = io.popen(command)
	if file then
		---@type string
		local result = file:read("*a")
		file:close()
		return result:gsub("\n$", "")
	else
		wezterm.log_error("Error opening file")
		return ""
	end
end

-- M.default_prog = { 'zsh' }
M.default_prog = { "nu" }

return M
