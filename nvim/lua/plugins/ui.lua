local buf_read = "BufRead"

return {
  {
    -- colorscheme
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").load({ style = "moon" })
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
