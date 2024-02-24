return {
  {
    -- colorscheme
    "rebelot/kanagawa.nvim",
    config = function()
      require("kanagawa").load("wave")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "echasnovski/mini.files",
    config = true,
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = true,
  },
  {
    "echasnovski/mini.pick",
    config = true,
    lazy = true,
    opts = {
      mappings = {
        move_down = "<C-j>",
        move_up = "<C-k>",
      },
      options = {
        use_cache = true,
      },
    },
  },
}
