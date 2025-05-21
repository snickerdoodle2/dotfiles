local M = {}

---@param path String
M.basename = function(path)
    return string.gsub(path, '(.*[/\\])(.*)', '%2')
end

return M
