return {
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      local catppuccin, flavour = require("catppuccin"), "mocha"
      local cp = require("catppuccin.palettes").get_palette(flavour)

      catppuccin.setup({
        flavour = flavour,
        integrations = {
          lsp_saga = true,
          nvimtree = false,
          telescope = false,
        },
      })

      catppuccin.load(flavour)
    end,
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
