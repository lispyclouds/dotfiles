vim.o.background = "dark"
vim.o.termguicolors = true

require("kanagawa").setup({
  dimInactive = true,
  globalStatus = true,
  overrides = {
    Visual = { bg = require("kanagawa.colors").setup().fujiGray },
  },
})

vim.cmd("colorscheme kanagawa")
