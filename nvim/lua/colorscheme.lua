vim.o.background    = "dark"
vim.o.termguicolors = true

local catppuccino = require("catppuccino")

catppuccino.setup({
  integrations = {
    gitsigns   = true,
		telescope  = true,
		nvimtree   = true,
		which_key  = true,
    bufferline = true,
    markdown   = true,
  },
})

catppuccino.load()
