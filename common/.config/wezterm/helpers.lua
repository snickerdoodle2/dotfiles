local wezterm = require('wezterm')
local M = {}

---@param path String
M.basename = function(path)
    path = string.gsub(path, "/?$", "")
    return string.gsub(path, '(.*[/\\])(.*)', '%2')
end

M.run = function(command)
    local file = io.popen(command)
    if file then
        local result = file:read("*a")
        file:close()
        return result
    else
        wezterm.log_error("Error opening file")
    end
end

return M
