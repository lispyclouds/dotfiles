vim.o.background = "dark"
vim.o.termguicolors = true

require("kanagawa").setup({
  dimInactive = true,
  globalStatus = true,
  colors = {
    waveBlue1 = "#49473E", -- Visual selection colour: https://github.com/rebelot/kanagawa.nvim#color-palette
  },
})

vim.cmd("colorscheme kanagawa")
