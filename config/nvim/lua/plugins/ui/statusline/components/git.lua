local conditions = require("heirline.conditions")
local separator = require("plugins.ui.statusline.components.seperator")

return {
	condition = conditions.is_git_repo,
	init = function(self)
		self.status_dict = vim.b.gitsigns_status_dict
	end,
	hl = { bold = true },
	separator,
	{
		provider = " ",
		hl = { fg = "yellow" },
	},
	{
		provider = function(self)
			return self.status_dict.head .. " "
		end,
	},
	{
		provider = function(self)
			return (self.status_dict.added or 0) .. " "
		end,
		hl = { fg = "green" },
	},
	{
		provider = function(self)
			return (self.status_dict.changed or 0) .. " "
		end,
		hl = { fg = "yellow" },
	},
	{
		provider = function(self)
			return (self.status_dict.removed or 0)
		end,
		hl = { fg = "red" },
	},
}
