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
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- 8 line padding
vim.opt.scrolloff = 8

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"

vim.g.netrw_banner = 0

vim.opt.signcolumn = "yes"

vim.opt.mouse = nil
