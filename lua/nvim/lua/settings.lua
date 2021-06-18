vim.o.history = 1000
vim.o.so = 7
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"
vim.o.cmdheight = 1
vim.o.hid = true
vim.o.ignorecase = true
vim.o.wrap = false
vim.o.ruler = true
vim.o.number = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.relativenumber = true
vim.o.clipboard = "unnamedplus"
vim.o.updatetime = 250
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.lazyredraw = true
vim.o.magic = true
vim.o.showmatch = true
vim.o.mat = 2
vim.o.ffs = "unix,dos,mac"
vim.o.errorbells = false
vim.o.visualbell = false
vim.o.tm = 500
vim.o.foldcolumn = "1"
vim.o.shiftwidth = 4
vim.o.tabstop = 4

vim.o.background = "dark"
vim.o.termguicolors = true

vim.g.tokyonight_style = "night"
vim.g.tokyonight_enable_italic = true
vim.cmd("colorscheme tokyonight")

vim.g.airline_theme = "tokyonight"
vim.g.airline_powerline_fonts = 1
vim.g.airline_left_sep = ""
vim.g.airline_left_alt_sep = ""
vim.g.airline_right_sep = ""
vim.g.airline_skip_empty_sections = 1
vim.g.airline_right_alt_sep = ""
require("bufferline").setup{}
