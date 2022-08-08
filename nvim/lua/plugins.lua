local buf_read = "BufRead"
local vim_enter = "VimEnter"
local lisps = { "clojure", "fennel" }
local after_cmp = { after = "nvim-cmp" }

local plugins = {
  ["wbthomason/packer.nvim"] = {},
  ["lewis6991/impatient.nvim"] = {},
  ["kyazdani42/nvim-web-devicons"] = {},
  ["rebelot/kanagawa.nvim"] = {
    config = "require('colorscheme')",
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    config = "require('treesitter')",
  },
  ["nvim-telescope/telescope.nvim"] = {
    event = vim_enter,
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
    config = function()
      require("bufferline").setup({})
    end,
  },
  ["nvim-lualine/lualine.nvim"] = {
    event = buf_read,
    config = function()
      require("lualine").setup({
        theme = "kanagawa",
        options = {
          section_separators = "",
          component_separators = "",
        },
      })
    end,
  },
  ["L3MON4D3/LuaSnip"] = {},
  ["hrsh7th/nvim-cmp"] = {
    config = "require('completion')",
    event = buf_read,
  },
  ["hrsh7th/cmp-nvim-lsp"] = after_cmp,
  ["hrsh7th/cmp-buffer"] = after_cmp,
  ["hrsh7th/cmp-nvim-lua"] = after_cmp,
  ["hrsh7th/cmp-path"] = after_cmp,
  ["saadparwaiz1/cmp_luasnip"] = after_cmp,
  ["neovim/nvim-lspconfig"] = {
    requires = {
      "jose-elias-alvarez/null-ls.nvim",
    },
    event = buf_read,
    config = "require('lsp')",
  },
  ["lewis6991/gitsigns.nvim"] = {
    event = buf_read,
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
  ["famiu/bufdelete.nvim"] = {
    event = buf_read,
  },
  ["Olical/conjure"] = {
    ft = lisps,
  },
  ["eraserhd/parinfer-rust"] = {
    ft = lisps,
    run = "cargo build --release",
  },
  ["p00f/nvim-ts-rainbow"] = {
    event = vim_enter,
    requires = "neovim/nvim-lspconfig",
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
    config = function()
      require("lsp_lines").setup()

      vim.diagnostic.config({
        virtual_text = false,
      })
    end,
  },
}

return require("packer").startup(function(use)
  if vim.loop.os_uname().sysname == "Darwin" then
    plugins["jjo/vim-cue"] = {}
  end

  for plugin, conf in pairs(plugins) do
    use({
      plugin,
      event = conf.event,
      cmd = conf.cmd,
      requires = conf.requires,
      run = conf.run,
      config = conf.config,
      ft = conf.ft,
      branch = conf.branch,
      as = conf.as,
    })
  end
end)
