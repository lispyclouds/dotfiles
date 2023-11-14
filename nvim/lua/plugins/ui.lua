local nvim_web_devicons = "nvim-tree/nvim-web-devicons"

return {
  nvim_web_devicons,
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
          telescope = { style = "nvchad" },
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
}
