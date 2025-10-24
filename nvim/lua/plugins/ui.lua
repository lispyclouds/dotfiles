local disabled = { enabled = false }

return {
  {
    -- colorscheme
    "scottmckendry/cyberdream.nvim",
    config = function()
      local theme = require("cyberdream")

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

      animate = disabled,
      bigfile = disabled,
      bufdelete = disabled,
      dashboard = disabled,
      debug = disabled,
      dim = disabled,
      explorer = disabled,
      git = disabled,
      gitbrowse = disabled,
      image = disabled,
      indent = disabled,
      input = disabled,
      layout = disabled,
      lazygit = disabled,
      notifier = disabled,
      notify = disabled,
      profiler = disabled,
      quickfile = disabled,
      rename = disabled,
      scope = disabled,
      scratch = disabled,
      scroll = disabled,
      statuscolumn = disabled,
      terminal = disabled,
      toggle = disabled,
      util = disabled,
      win = disabled,
      words = disabled,
      zen = disabled,
    },
  },
}
