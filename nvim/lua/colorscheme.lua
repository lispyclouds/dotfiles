vim.o.background = "dark"
vim.o.termguicolors = true

vim.g.catppuccin_flavour = "mocha"

require("catppuccin").load({
  term_colors = true,
  integrations = {
    ts_rainbow = true,
    neotree = {
      enabled = true,
    },
  },
})
