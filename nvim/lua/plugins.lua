local fn           = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local plugins      = {
  defaults    = {
    "shaunsingh/moonlight.nvim", -- colorscheme
    "wbthomason/packer.nvim",
    "kyazdani42/nvim-tree.lua",
    "kyazdani42/nvim-web-devicons",
    "ntpeters/vim-better-whitespace",
    "dense-analysis/ale",
    "neovim/nvim-lspconfig",
    "famiu/bufdelete.nvim",
  },
  with_config = {
    ["beauwilliams/statusline.lua"] = {
      requires = "kosayoda/nvim-lightbulb",
      config   = function()
        require("statusline").tabline = false
      end,
    },
    ["nvim-treesitter/nvim-treesitter"] = {
      run = ":TSUpdate",
    },
    ["nvim-telescope/telescope.nvim"] = {
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
      },
    },
    ["akinsho/nvim-bufferline.lua"] = {
      requires = "kyazdani42/nvim-web-devicons",
      config   = function()
        require("bufferline").setup{}
      end,
    },
    ["hashivim/vim-terraform"] = {
      ft = "terraform",
    },
    ["hrsh7th/nvim-compe"] = {
      config = function()
        require("compe").setup {
          enabled      = true,
          autocomplete = true,
          source       = {
            path     = true,
            buffer   = true,
            calc     = true,
            nvim_lsp = true,
            nvim_lua = true,
          },
        }
      end,
    },
    ["lewis6991/gitsigns.nvim"] = {
      requires = "nvim-lua/plenary.nvim",
      config   = function()
        require("gitsigns").setup()
      end,
    },
    ["Olical/conjure"] = {
      ft = "clojure",
    },
    ["guns/vim-sexp"] = {
      ft = "clojure",
    },
    ["eraserhd/parinfer-rust"] = {
      ft  = "clojure",
      run = "cargo build --release",
    },
    ["folke/which-key.nvim"] = {
      config = function()
        require("which-key").setup{}
      end,
    },
  },
}

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.api.nvim_command("packadd packer.nvim")
end

require("packer").startup(
  function()
    for _, plugin in pairs(plugins.defaults) do
      use(plugin)
    end

    for plugin, conf in pairs(plugins.with_config) do
      use {
        plugin,
        requires = conf.requires,
        run      = conf.run,
        config   = conf.config,
        ft       = conf.ft,
      }
    end
  end
)
