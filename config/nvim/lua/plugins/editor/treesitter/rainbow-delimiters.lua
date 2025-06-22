return {
	"HiPhish/rainbow-delimiters.nvim",
	event = "LazyFile",
	config = function()
		require("rainbow-delimiters.setup").setup({
			query = {
				heex = "rainbow-delimiters",
			},
		})
	end,
}
