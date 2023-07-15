local nvim_web_devicons = "nvim-tree/nvim-web-devicons"
local plenary = "nvim-lua/plenary.nvim"
local buf_read = "BufRead"

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
          barbar = true,
        },
        highlight_overrides = {
          [flavour] = {
            TelescopeBorder = { fg = cp.surface0, bg = cp.surface0 },
            TelescopeSelectionCaret = { fg = cp.flamingo, bg = cp.surface1 },
            TelescopeMatching = { fg = cp.peach },
            TelescopeNormal = { bg = cp.surface0 },
            TelescopeSelection = { fg = cp.text, bg = cp.surface1 },
            TelescopeMultiSelection = { fg = cp.text, bg = cp.surface2 },
            TelescopeTitle = { fg = cp.crust, bg = cp.green },
            TelescopePreviewTitle = { fg = cp.crust, bg = cp.red },
            TelescopePromptTitle = { fg = cp.crust, bg = cp.mauve },
            TelescopePromptNormal = { fg = cp.flamingo, bg = cp.crust },
            TelescopePromptBorder = { fg = cp.crust, bg = cp.crust },
          },
        },
      })

      catppuccin.load(flavour)
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      nvim_web_devicons,
      plenary,
      "MunifTanjim/nui.nvim",
    },
    cmd = "Neotree",
    opts = {
      window = {
        width = 25,
      },
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
    },
  },
  {
    "romgrk/barbar.nvim",
    event = buf_read,
    dependencies = {
      nvim_web_devicons,
    },
    cmd = {
      "BufferClose",
      "BufferPrevious",
      "BufferNext",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = buf_read,
    dependencies = {
      plenary,
    },
    config = true,
  },
}
