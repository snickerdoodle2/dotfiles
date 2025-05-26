local conditions = require("heirline.conditions")
local utils = require("heirline.utils")
local separator = require("plugins.ui.statusline.components.seperator")

return {
	condition = conditions.has_diagnostics,
	static = {
		error_icon = "󰅚 ",
		warn_icon = "󰀪 ",
		info_icon = "󰋽 ",
		hint_icon = "󰌶 ",
	},
	update = { "DiagnosticChanged", "BufEnter" },
	init = function(self)
		self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
		self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
		self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
		self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
	end,
	{
		separator,
		{
			provider = function(self)
				return self.errors > 0 and (self.error_icon .. self.errors)
			end,
			hl = { fg = utils.get_highlight("DiagnosticError").fg },
		},
		{
			provider = function(self)
				return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
			end,
			hl = { fg = utils.get_highlight("DiagnosticWarn").fg },
		},
		{
			provider = function(self)
				return self.info > 0 and (self.info_icon .. self.info .. " ")
			end,
			hl = { fg = utils.get_highlight("DiagnosticInfo").fg },
		},
		{
			provider = function(self)
				return self.hints > 0 and (self.hint_icon .. self.hints .. " ")
			end,
			hl = { fg = utils.get_highlight("DiagnosticHint").fg },
		},
	},
}
