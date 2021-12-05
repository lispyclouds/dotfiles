vim.o.background = "dark"
vim.o.termguicolors = true

local catppuccin = require("catppuccin")

catppuccin.setup({
  term_colors = true,
  integrations = {
    gitsigns = true,
    telescope = true,
    nvimtree = {
      enabled = true,
      show_root = true,
    },
    which_key = true,
    bufferline = true,
    markdown = false,
    ts_rainbow = false,
  },
})

vim.cmd("colorscheme catppuccin")
