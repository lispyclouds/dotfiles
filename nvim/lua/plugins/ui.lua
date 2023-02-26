local nvim_web_devicons = "nvim-tree/nvim-web-devicons"
local plenary = "nvim-lua/plenary.nvim"
local buf_read = "BufRead"

return {
  nvim_web_devicons,
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      nvim_web_devicons,
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    cmd = { "NeoTreeFocusToggle" },
    opts = {
      window = {
        width = 25,
      },
      filesystem = {
        use_libuv_file_watcher = true,
        follow_current_file = true,
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
