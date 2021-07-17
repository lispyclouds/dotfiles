local execute      = vim.api.nvim_command
local fn           = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local defaults     = {}
local plugins      = {
  ["shaunsingh/moonlight.nvim"]      = defaults, -- colorscheme
  ["wbthomason/packer.nvim"]         = defaults,
  ["kyazdani42/nvim-tree.lua"]       = defaults,
  ["kyazdani42/nvim-web-devicons"]   = defaults,
  ["ntpeters/vim-better-whitespace"] = defaults,
  ["dense-analysis/ale"]             = defaults,
  ["neovim/nvim-lspconfig"]          = defaults,
  ["famiu/bufdelete.nvim"]           = defaults,

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
    ft = {"terraform"},
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
    ft = {"clojure"},
  },
  ["guns/vim-sexp"] = {
    ft = {"clojure"},
  },
  ["eraserhd/parinfer-rust"] = {
    ft  = {"clojure"},
    run = {"cargo build --release"},
  },
}

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

require("packer").startup(
  function()
    for plugin, conf in pairs(plugins) do
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
