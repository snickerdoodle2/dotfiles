return {
	"echasnovski/mini.surround",
	version = "*",
	keys = {
		{ "<leader>sa", mode = { "n", "v" } },
		{ "<leader>sd", mode = { "n" } },
		{ "<leader>sf", mode = { "n" } },
		{ "<leader>sF", mode = { "n" } },
		{ "<leader>sh", mode = { "n" } },
		{ "<leader>sr", mode = { "n" } },
		{ "<leader>sn", mode = { "n" } },
	},
	opts = {
		mappings = {
			add = "<leader>sa", -- Add surrounding in Normal and Visual modes
			delete = "<leader>sd", -- Delete surrounding
			find = "<leader>sf", -- Find surrounding (to the right)
			find_left = "<leader>sF", -- Find surrounding (to the left)
			highlight = "<leader>sh", -- Highlight surrounding
			replace = "<leader>sr", -- Replace surrounding
			update_n_lines = "<leader>sn", -- Update `n_lines`
		},
	},
}
