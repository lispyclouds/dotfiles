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
    "ibhagwan/fzf-lua",
    lazy = true,
    config = function()
      require("fzf-lua").setup({})
    end,
  },
}
