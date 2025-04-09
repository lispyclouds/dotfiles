return {
  {
    -- colorscheme
    "scottmckendry/cyberdream.nvim",
    config = function()
      theme = require("cyberdream")

      theme.setup({
        cache = true,
        transparent = true,
      })
      theme.load()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = true,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = true,
    ft = "markdown",
  },
  {
    "MagicDuck/grug-far.nvim",
    config = true,
    lazy = true,
  },
  {
    "folke/snacks.nvim",
    lazy = true,
    opts = {
      picker = { enabled = true },

      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  },
}
