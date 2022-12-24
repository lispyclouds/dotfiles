local buf_read = "BufRead"

return {
  "kyazdani42/nvim-web-devicons",
  {
    "sam4llis/nvim-tundra",
    config = function()
      require("nvim-tundra").setup({
        transparent_background = false,
        plugins = {
          cmp = true,
          gitsigns = true,
          lsp = true,
          telescope = true,
          treesitter = true,
        },
      })

      vim.cmd("colorscheme tundra")
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync" },
    config = function() require("treesitter") end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = {
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
          },
        },
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "NeoTreeFocusToggle",
    branch = "v2.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = {
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
    "akinsho/bufferline.nvim",
    event = buf_read,
    cmd = { "BufferLineCyclePrev", "BufferLineCycleNext" },
    config = true,
  },
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bwipeout" },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = buf_read,
    config = function() require("statusline") end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function() require("completion") end,
    dependencies = {
      "L3MON4D3/LuaSnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip",
      "jose-elias-alvarez/null-ls.nvim",
    },
  },
  {
    "neovim/nvim-lspconfig",
    event = buf_read,
    dependencies = {
      "hrsh7th/nvim-cmp",
    },
    config = function() require("lsp") end,
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
    event = buf_read,
  },
  {
    "gpanders/nvim-parinfer",
    event = buf_read,
    config = function() vim.g.parinfer_force_balance = true end,
  },
  {
    "p00f/nvim-ts-rainbow",
    event = buf_read,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          extended_mode = true,
        },
      })
    end,
  },
  {
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = buf_read,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    event = buf_read,
    config = true,
  },
}
