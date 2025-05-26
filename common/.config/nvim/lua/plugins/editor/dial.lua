local M = {}

---@param increment boolean
---@param g? boolean
function M.dial(increment, g)
	local mode = vim.fn.mode(true)
	-- Use visual commands for VISUAL 'v', VISUAL LINE 'V' and VISUAL BLOCK '\22'
	local is_visual = mode == "v" or mode == "V" or mode == "\22"
	local func = (increment and "inc" or "dec") .. (g and "_g" or "_") .. (is_visual and "visual" or "normal")
	local group = vim.g.dials_by_ft[vim.bo.filetype] or "default"
	return require("dial.map")[func](group)
end

return {
	"monaqa/dial.nvim",
	keys = {
		{
			"<C-a>",
			function()
				return M.dial(true)
			end,
			expr = true,
			desc = "Increment",
			mode = { "n", "v" },
		},
		{
			"<C-x>",
			function()
				return M.dial(false)
			end,
			expr = true,
			desc = "Decrement",
			mode = { "n", "v" },
		},
		{
			"g<C-a>",
			function()
				return M.dial(true, true)
			end,
			expr = true,
			desc = "Increment",
			mode = { "n", "v" },
		},
		{
			"g<C-x>",
			function()
				return M.dial(false, true)
			end,
			expr = true,
			desc = "Decrement",
			mode = { "n", "v" },
		},
	},
	opts = function()
		local augend = require("dial.augend")

		local hex = augend.integer.new({ radix = 16, prefix = "0x", natural = true, case = "upper" }) -- hex
		local logical = augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true })
		local capitalized_bool = augend.constant.new({ elements = { "True", "False" }, word = true, cyclic = true })

		-- TODO: add more :)
		return {
			dials_by_ft = {
				markdown = "markdown",
			},
			groups = {
				default = {
					augend.integer.alias.decimal_int, -- 0, 314, -1592
					hex,
					augend.integer.alias.octal,
					augend.integer.alias.binary,

					augend.constant.alias.bool,
					capitalized_bool,
					logical,
					augend.semver.alias.semver,
				},
				markdown = {
					augend.misc.alias.markdown_header,
				},
			},
		}
	end,
	config = function(_, opts)
		for name, group in pairs(opts.groups) do
			if name ~= "default" then
				vim.list_extend(group, opts.groups.default)
			end
		end
		require("dial.config").augends:register_group(opts.groups)
		vim.g.dials_by_ft = opts.dials_by_ft
	end,
}
