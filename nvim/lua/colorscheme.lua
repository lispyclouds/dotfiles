vim.o.background = "dark"
vim.o.termguicolors = true

require("everblush").setup({
  override = {
    CursorLineNr = {
      fg = require("everblush.core").get_colors().foreground,
    },
  },
})
