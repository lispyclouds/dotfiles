vim.o.background = "dark"
vim.o.termguicolors = true

require("kanagawa").setup({
  dimInactive = true,
  globalStatus = true,
})

vim.cmd("colorscheme kanagawa")
