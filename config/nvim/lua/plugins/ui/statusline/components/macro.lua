local utils = require("heirline.utils")
local separator = require("plugins.ui.statusline.components.seperator")

return {
	condition = function()
		return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
	end,
	{
		provider = "  ",
		hl = { fg = "teal", bold = true },
	},
	{
		provider = function()
			return vim.fn.reg_recording()
		end,
		hl = { fg = "green", bold = true },
	},
	separator,
	update = {
		"RecordingEnter",
		"RecordingLeave",
	},
}
