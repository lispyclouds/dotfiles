vim.o.autoindent = true
vim.o.clipboard = "unnamedplus"
vim.o.cmdheight = 1
vim.o.completeopt = "menuone,noselect"
vim.o.cursorline = true
vim.o.errorbells = false
vim.o.expandtab = true
vim.o.fileformats = "unix,dos,mac"
vim.o.foldcolumn = "1"
vim.o.hidden = true
vim.o.history = 1000
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.laststatus = 3
vim.o.lazyredraw = true
vim.o.magic = true
vim.o.mat = 2
vim.o.mouse = "nvi"
vim.o.number = true
vim.o.relativenumber = true
vim.o.ruler = true
vim.o.scrolloff = 7
vim.o.shiftwidth = 2
vim.o.shortmess = "I"
vim.o.showmatch = true
vim.o.smartindent = true
vim.o.smarttab = true
vim.o.tabstop = 2
vim.o.termguicolors = true
vim.o.timeoutlen = 500
vim.o.updatetime = 100
vim.o.visualbell = false
vim.o.wrap = true

local font_name = "FantasqueSansMono Nerd Font"
local font = font_name .. ":h12:b"
if vim.loop.os_uname().sysname == "Darwin" then font = font_name .. ":h14" end
vim.o.guifont = font

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 }) end,
})
