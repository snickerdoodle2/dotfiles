vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- Disable highlight on <Esc>
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR><Esc>", { noremap = true })

-- Move code blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in place while J
vim.keymap.set("n", "J", "mzJ`z")

-- Keep cursor at middle while jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Copy to system clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- ex mode
vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set({ "n", "i" }, "<F1>", "<nop>")

vim.keymap.set("n", "<leader>k", function()
	vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })

	vim.api.nvim_create_autocmd("CursorMoved", {
		group = vim.api.nvim_create_augroup("line-diagnostics", { clear = true }),
		callback = function()
			vim.diagnostic.config({ virtual_lines = false, virtual_text = true })
			return true
		end,
	})
end, { desc = "Show virtual lines" })
