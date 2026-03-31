vim.g.parinfer_force_balance = true

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

-- clojure
-- TODO: ft clojure
vim.api.nvim_create_autocmd("BufNewFile", {
  group = vim.api.nvim_create_augroup("conjure-log-disable-lsp", { clear = true }),
  pattern = { "conjure-log-*" },
  callback = function(event)
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
  desc = "Conjure Log disable LSP diagnostics",
})

-- others
require("mini.icons").setup()
require("snacks").setup({ picker = { enabled = true } })
require("statusline")
require("treesitter")
