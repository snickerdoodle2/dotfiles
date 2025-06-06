return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
		"nvim-lua/plenary.nvim",
	},
	ft = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"vue",
		"svelte",
		"astro",
	},
	opts = function()
		local sources = {
			require("none-ls.diagnostics.eslint_d"),
			require("none-ls.code_actions.eslint_d"),
		}

		return {
			sources = sources,
		}
	end,
}
