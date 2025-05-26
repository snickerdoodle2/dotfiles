return {
	"stevearc/oil.nvim",
	event = "VimEnter",
	dependencies = {
		"echasnovski/mini.icons",
	},
	keys = { { "<leader>ee", "<cmd>Oil<CR>", mode = { "n" }, desc = "Open oil" } },
	opts = {
		keymaps = {
			["<C-s>"] = false,
			["<C-h>"] = false,
			["<C-t>"] = false,
			["<C-p>"] = false,
			["<C-c>"] = false,
			["<C-l>"] = false,
		},
	},
	config = function(_, opts)
		require("oil").setup(opts)
		vim.api.nvim_create_autocmd("User", {
			pattern = "OilActionsPost",
			callback = function(event)
				if event.data.actions.type == "move" then
					Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
				end
			end,
		})
	end,
}
