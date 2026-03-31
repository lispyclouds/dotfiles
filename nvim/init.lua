require("settings")
require("mappings")
require("lsp")

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
  "https://github.com/scottmckendry/cyberdream.nvim",
})

-- theme
local theme = require("cyberdream")
theme.setup({
  cache = true,
  transparent = true,
})
theme.load()

-- others
require("mini.icons").setup()
require("snacks").setup({ picker = { enabled = true } })
require("statusline")
require("treesitter")
