return {
  {
    -- colorscheme
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").colorscheme()
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
