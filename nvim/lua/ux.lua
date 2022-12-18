local font_name = "JetBrainsMono Nerd Font Mono"
local font = font_name .. ":h10:b"

require("impl").setopts({
  autoindent = true,
  clipboard = "unnamedplus",
  cmdheight = 1,
  completeopt = "menuone,noselect",
  cursorline = true,
  errorbells = false,
  expandtab = true,
  fileformats = "unix,dos,mac",
  foldcolumn = "1",
  hidden = true,
  history = 1000,
  hlsearch = true,
  ignorecase = true,
  incsearch = true,
  laststatus = 3,
  lazyredraw = true,
  magic = true,
  mat = 2,
  mouse = "nvi",
  number = true,
  relativenumber = true,
  ruler = true,
  scrolloff = 7,
  shiftwidth = 2,
  shortmess = "I",
  showmatch = true,
  smartindent = true,
  smarttab = true,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 500,
  updatetime = 100,
  visualbell = false,
  wrap = true,
})

if vim.loop.os_uname().sysname == "Darwin" then font = font_name .. ":h14" end
vim.o.guifont = font

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 }) end,
})
