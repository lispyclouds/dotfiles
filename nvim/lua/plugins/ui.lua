local nvim_web_devicons = "nvim-tree/nvim-web-devicons"
local plenary = "nvim-lua/plenary.nvim"

return {
  nvim_web_devicons,
  {
    "olivercederborg/poimandres.nvim",
    config = function()
      require("poimandres").colorscheme()
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
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    dependencies = {
      plenary,
    },
    config = true,
  },
  {
    "ThePrimeagen/harpoon",
    lazy = true,
    config = true,
  },
}
