vim.o.history = 1000
vim.o.scrolloff = 7
vim.o.cmdheight = 1
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.wrap = true
vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.smarttab = true
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.updatetime = 250
vim.o.incsearch = true
vim.o.hlsearch = true
vim.o.lazyredraw = true
vim.o.magic = true
vim.o.showmatch = true
vim.o.mat = 2
vim.o.fileformats = "unix,dos,mac"
vim.o.errorbells = false
vim.o.visualbell = false
vim.o.timeoutlen = 500
vim.o.foldcolumn = "1"
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.completeopt = "menuone,noselect"
vim.o.shortmess = "I"
vim.o.mouse = "a"
vim.o.termguicolors = true
vim.o.laststatus = 3

if vim.loop.os_uname().sysname == "Linux" then
  vim.o.guifont = "FantasqueSansMono Nerd Font Mono:h12:b"
else
  vim.o.guifont = "FantasqueSansMono Nerd Font Mono:h16"
end

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 })
  end,
})
