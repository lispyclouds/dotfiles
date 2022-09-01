vim.o.background = "dark"
vim.o.termguicolors = true

vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup({
  dim_inactive = {
    enabled = true,
  },
  term_colors = true,
  compile = {
    enabled = true,
  },
  integrations = {
    neotree = {
      enabled = true,
    },
  },
})

vim.cmd("colorscheme catppuccin")
