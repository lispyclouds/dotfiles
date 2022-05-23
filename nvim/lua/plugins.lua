local buf_read = "BufRead"
local vim_enter = "VimEnter"
local lisps = { "clojure", "fennel" }

local plugins = {
  ["wbthomason/packer.nvim"] = {},
  ["lewis6991/impatient.nvim"] = {},
  ["kyazdani42/nvim-web-devicons"] = {},
  ["catppuccin/nvim"] = {
    as = "catppuccin",
    config = function()
      require("colorscheme")
    end,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    run = ":TSUpdate",
    config = function()
      require("treesitter")
    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    event = vim_enter,
    requires = {
      "nvim-lua/popup.nvim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
            file_ignore_patterns = {
              ".git/",
              ".node_modules/",
              ".terraform/"
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
          use_libuv_file_watcher = false,
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
  ["feline-nvim/feline.nvim"] = {
    event = buf_read,
    config = function()
      require("feline").setup({
        components = require("catppuccin.core.integrations.feline"),
      })
    end,
  },
  ["hrsh7th/nvim-cmp"] = {
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      require("completion")
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    event = buf_read,
    config = function()
      require("lsp")
    end,
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
  ["guns/vim-sexp"] = {
    ft = lisps,
  },
  ["eraserhd/parinfer-rust"] = {
    ft = lisps,
    run = "cargo build --release",
  },
  ["hashivim/vim-terraform"] = {
    ft = "terraform",
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
  ["jose-elias-alvarez/null-ls.nvim"] = {
    event = buf_read,
    config = function()
      local nls = require("null-ls")

      nls.setup({
        sources = {
          nls.builtins.diagnostics.shellcheck.with({
            extra_filetypes = { "zsh" },
          }),
          nls.builtins.diagnostics.hadolint,
        },
      })
    end,
  },
}

return require("packer").startup(function(use)
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
