local buf_read = "BufRead"
local lisps = { "clojure", "fennel" }

return {
  "nvim-tree/nvim-web-devicons",
  {
    "sam4llis/nvim-tundra",
    config = function()
      local tundra = require("nvim-tundra")

      tundra.setup({
        plugins = {
          cmp = true,
          gitsigns = true,
          lsp = true,
          telescope = true,
          treesitter = true,

          context = false,
          dbui = false,
          neogit = false,
          nvimtree = false,
        },
      })

      tundra.load()
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
      "nvim-telescope/telescope-live-grep-args.nvim",
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
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
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
