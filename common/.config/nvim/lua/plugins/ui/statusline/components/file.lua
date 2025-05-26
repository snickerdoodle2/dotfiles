local mini_icons = require("mini.icons")
local conditions = require("heirline.conditions")
local separator = require("plugins.ui.statusline.components.seperator")

local icon = {
	init = function(self)
		self.icon, self.icon_color = mini_icons.get("file", self.filename)
	end,
	provider = function(self)
		return self.icon and (self.icon .. "  ")
	end,
	hl = function(self)
		return self.icon_color
	end,
}

local filename = {
	provider = function(self)
		local filename = vim.fn.fnamemodify(self.filename, ":.")
		if filename == "" then
			return "[No Name]"
		end
		if not conditions.width_percent_below(#filename, 0.25) then
			filename = vim.fn.pathshorten(filename)
		end
		return filename
	end,
	hl = function(self)
		if vim.bo.modified then
			return { fg = "green", bold = true }
		end
	end,
}

local flags = {
	{
		condition = function()
			return vim.bo.modified
		end,
		provider = " ",
		hl = { fg = "green" },
	},
	{
		condition = function()
			return not vim.bo.modifiable or vim.bo.readonly
		end,
		provider = " ",
		hl = { fg = "yellow" },
	},
}

return {
	init = function(self)
		self.filename = vim.api.nvim_buf_get_name(0)
	end,
	separator,
	icon,
	filename,
	flags,
}
