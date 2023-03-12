local nvim_web_devicons = "nvim-tree/nvim-web-devicons"
local plenary = "nvim-lua/plenary.nvim"
local buf_read = "BufRead"

return {
  nvim_web_devicons,
  {
    "folke/tokyonight.nvim",
    config = function()
      local tok = require("tokyonight")

      tok.setup({
        on_highlights = function(hl, c)
          local prompt = "#2d3149"

          hl.TelescopeNormal = {
            bg = c.bg_dark,
            fg = c.fg_dark,
          }
          hl.TelescopeBorder = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopePromptNormal = {
            bg = prompt,
          }
          hl.TelescopePromptBorder = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePromptTitle = {
            bg = prompt,
            fg = prompt,
          }
          hl.TelescopePreviewTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
          hl.TelescopeResultsTitle = {
            bg = c.bg_dark,
            fg = c.bg_dark,
          }
        end,
      })

      tok._load("night")
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      nvim_web_devicons,
      plenary,
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
