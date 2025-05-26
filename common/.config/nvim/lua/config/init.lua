require("config.remaps")
require("config.augroups")
require("config.colors")

-- Relative numbers
vim.opt.nu = true
vim.opt.relativenumber = true

-- 4 width indent
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- auto indent
vim.opt.smartindent = true

vim.opt.wrap = false

-- Better undo history
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.showmode = false

vim.opt.termguicolors = true

-- 8 line padding
vim.opt.scrolloff = 8

vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.colorcolumn = "81"

vim.g.netrw_banner = 0

vim.opt.signcolumn = "yes"

vim.o.cmdheight = 0
vim.opt.shortmess = vim.opt.shortmess
	+ {
		c = true, -- Do not show completion messages in command line
		F = true, -- Do not show file info when editing a file, in the command line
		W = true, -- Do not show "written" in command line when writing
		I = true, -- Do not show intro message when starting Vim
	}

vim.opt.mouse = nil

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
