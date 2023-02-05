local buf_read = "BufRead"
local lisps = { "clojure", "fennel" }

return {
  "nvim-tree/nvim-web-devicons",
  {
    "folke/tokyonight.nvim",
    config = function()
      local tokyo = require("tokyonight")

      tokyo.setup({
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

      tokyo._load("night")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync" },
    config = function() require("treesitter").setup() end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    cmd = { "Telescope" },
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    opts = {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
          file_ignore_patterns = {
            ".git/",
            ".node_modules/",
            ".terraform/",
            ".mypy_cache/",
            "__pycache__/",
            ".cache/",
            ".cpcache/",
          },
        },
      },
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    lazy = true,
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    config = function()
      local ts = require("telescope")

      ts.setup({
        extensions = {
          file_browser = {
            hijack_netrw = true,
          },
        },
      })
      ts.load_extension("file_browser")
    end,
  },
  {
    "romgrk/barbar.nvim",
    event = buf_read,
    cmd = {
      "BufferClose",
      "BufferPrevious",
      "BufferNext",
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    config = function() require("statusline").setup() end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function() require("completion").setup() end,
    dependencies = {
      "dcampos/nvim-snippy",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = buf_read,
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function() require("lsp").setup() end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = buf_read,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = true,
  },
  {
    "Olical/conjure",
    ft = { "python", unpack(lisps) },
  },
  {
    "gpanders/nvim-parinfer",
    ft = lisps,
    config = function() vim.g.parinfer_force_balance = true end,
  },
  {
    "j-hui/fidget.nvim",
    event = buf_read,
    config = true,
  },
}
