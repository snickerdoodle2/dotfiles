return {
	"echasnovski/mini.icons",
	version = "*",
	lazy = true,
	opts = {
		lsp = {
			["function"] = { glyph = "󰡱" },
			snippet = { glyph = "󰰤" },
			constant = { glyph = "󰏿" },
		},
	},
	config = function(_, opts)
		require("mini.icons").setup(opts)
		MiniIcons.mock_nvim_web_devicons()
	end,
}
