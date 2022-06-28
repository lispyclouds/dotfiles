vim.o.background = "dark"
vim.o.termguicolors = true

require("kanagawa").setup({
  dimInactive = true,
  globalStatus = true,
  overrides = {
    Visual = { bg = "#665c54" },
  },
})

vim.cmd("colorscheme kanagawa")
