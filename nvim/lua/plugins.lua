local buf_read = "BufRead"
local lisps = { "clojure", "fennel" }

local plugins = {
  ["wbthomason/packer.nvim"] = {},
  ["lewis6991/impatient.nvim"] = {},
  ["kyazdani42/nvim-web-devicons"] = {},
  ["sam4llis/nvim-tundra"] = {
    config = "require('colorscheme')",
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    config = "require('treesitter')",
  },
  ["nvim-treesitter/playground"] = {
    event = buf_read,
    requires = { "nvim-treesitter/nvim-treesitter" },
  },
  ["nvim-telescope/telescope.nvim"] = {
    event = "VimEnter",
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
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
      })
    end,
  },
  ["nvim-neo-tree/neo-tree.nvim"] = {
    event = buf_read,
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
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
      })
    end,
  },
  ["akinsho/bufferline.nvim"] = {
    event = buf_read,
    config = "require('bufferline').setup({})",
  },
  ["nvim-lualine/lualine.nvim"] = {
    event = buf_read,
    config = "require('statusline')",
  },
  ["hrsh7th/nvim-cmp"] = {
    event = buf_read,
    config = "require('completion')",
  },
  ["hrsh7th/cmp-nvim-lsp"] = {
    after = "nvim-cmp",
  },
  ["hrsh7th/cmp-buffer"] = {
    after = "nvim-cmp",
  },
  ["hrsh7th/cmp-nvim-lua"] = {
    after = "nvim-cmp",
  },
  ["hrsh7th/cmp-path"] = {
    after = "nvim-cmp",
  },
  ["L3MON4D3/LuaSnip"] = {
    after = "nvim-cmp",
  },
  ["saadparwaiz1/cmp_luasnip"] = {
    after = "nvim-cmp",
  },
  ["neovim/nvim-lspconfig"] = {
    after = "nvim-cmp",
    config = "require('lsp')",
  },
  ["jose-elias-alvarez/null-ls.nvim"] = {
    after = "nvim-cmp",
  },
  ["lewis6991/gitsigns.nvim"] = {
    event = buf_read,
    requires = "nvim-lua/plenary.nvim",
    config = "require('gitsigns').setup()",
  },
  ["famiu/bufdelete.nvim"] = {
    event = buf_read,
  },
  ["Olical/conjure"] = {
    ft = { "python", unpack(lisps) },
  },
  ["guns/vim-sexp"] = { -- needed for strict parens
    ft = lisps,
  },
  ["eraserhd/parinfer-rust"] = {
    ft = lisps,
    run = "cargo build --release",
  },
  ["p00f/nvim-ts-rainbow"] = {
    event = buf_read,
    after = "nvim-lspconfig",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          extended_mode = true,
        },
      })
    end,
  },
  ["https://git.sr.ht/~whynothugo/lsp_lines.nvim"] = {
    event = buf_read,
    after = "nvim-lspconfig",
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
}

return require("packer").startup(function(use)
  for plugin, conf in pairs(plugins) do
    use({
      plugin,
      after = conf.after,
      as = conf.as,
      branch = conf.branch,
      cmd = conf.cmd,
      config = conf.config,
      event = conf.event,
      ft = conf.ft,
      requires = conf.requires,
      run = conf.run,
    })
  end
end)
