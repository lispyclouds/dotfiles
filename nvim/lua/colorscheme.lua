vim.o.background = "dark"
vim.o.termguicolors = true

local colors = require("everblush.core").get_colors()

require("everblush").setup({
  override = {
    CursorLineNr = { fg = colors.foreground },
    LineNr = { fg = colors.comment },
  },
})
