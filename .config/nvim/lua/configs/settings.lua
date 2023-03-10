-- My Options config file

-- mapleader key
vim.g.mapleader = ','

-- Colorizer
vim.opt.termguicolors = true -- precisa ser adicionado antes do plugin
require('colorizer').setup()

-- AirLine Theme setup
vim.g.airline_theme = 'dracula'

-- General Setup
vim.opt.compatible = false
vim.opt.mouse = 'a'
vim.opt.swapfile = false
vim.opt.history = 100
vim.opt.lazyredraw = true
vim.opt.synmaxcol = 240

-- Theme
vim.g.background = "dark"
vim.opt.termguicolors = true
vim.g.transparent_enabled = true
vim.cmd[[colorscheme dracula]]

-- Editor
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.signcolumn = 'yes'
vim.opt.showmatch = true
vim.opt.showmode = false
vim.opt.foldmethod = 'marker'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.conceallevel = 0
vim.opt.colorcolumn = '80'
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.smartindent = true
vim.opt.list = true
vim.opt.shortmess:append { c = true }
vim.opt.whichwrap:append {
	['<'] = true,
	['>'] = true,
	[','] = true,
	h = true,
	l = true
}
