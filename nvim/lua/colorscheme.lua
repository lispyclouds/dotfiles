vim.o.background = "dark"
vim.o.termguicolors = true

require("catppuccin").load({
  term_colors = true,
  integrations = {
    which_key = true,
    ts_rainbow = true,
  },
})
