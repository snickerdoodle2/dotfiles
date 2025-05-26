return {
	"j-hui/fidget.nvim",
	opts = {
		notification = {
			window = {
				max_width = vim.fn.winwidth(0) - 7 - vim.o.colorcolumn,
			},
		},
	},
}
