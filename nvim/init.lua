-- plugins
vim.pack.add({
  "https://github.com/MagicDuck/grug-far.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/Olical/conjure",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/gpanders/nvim-parinfer",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
})

-- theme
local theme = require("catppuccin")
theme.setup({
  flavour = "mocha",
  transparent_background = true,
  snacks = { enabled = true },
  gitsigns = true,
  grug_far = true,
  mini = { enabled = true },
})
theme.load("mocha")

-- config
require("settings")
require("mappings")
require("lsp")

require("mini.icons").setup()
require("snacks").setup({ picker = { enabled = true } })
require("statusline")
require("treesitter")
