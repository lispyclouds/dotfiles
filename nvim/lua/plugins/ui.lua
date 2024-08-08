local buf_read = "BufRead"

return {
  {
    -- colorscheme
    "eldritch-theme/eldritch.nvim",
    config = function()
      require("eldritch").load()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = buf_read,
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
}
