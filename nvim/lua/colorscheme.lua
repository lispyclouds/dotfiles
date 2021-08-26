vim.o.background    = "dark"
vim.o.termguicolors = true

local catppuccino = require("catppuccino")

catppuccino.setup({
  integrations = {
    gitsigns   = true,
    telescope  = true,
    nvimtree   = {
      enabled   = true,
      show_root = true,
    },
    which_key  = true,
    bufferline = true,
    markdown   = true,
  },
})

catppuccino.load()
