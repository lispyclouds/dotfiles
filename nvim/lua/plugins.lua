local fn           = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local buf_read     = "BufRead"
local plugins      = {
  defaults    = {
    "famiu/bufdelete.nvim",
  },
  with_config = {
    ["wbthomason/packer.nvim"] = {
      event = "VimEnter"
    },
    ["shaunsingh/moonlight.nvim"] = {
      after  = "packer.nvim",
      config = function()
        require("colorscheme")
      end,
    },
    ["beauwilliams/statusline.lua"] = {
      requires = "kosayoda/nvim-lightbulb",
      config   = function()
        require("statusline").tabline = false
      end,
    },
    ["nvim-treesitter/nvim-treesitter"] = {
      run    = ":TSUpdate",
      event  = buf_read,
      config = function()
        require("treesitter")
      end,
    },
    ["nvim-telescope/telescope.nvim"] = {
      cmd      = "Telescope",
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
    ["kyazdani42/nvim-tree.lua"] = {
      cmd = "NvimTreeToggle",
    },
    ["kyazdani42/nvim-web-devicons"] = {
      after = "moonlight.nvim",
    },
    ["hrsh7th/nvim-compe"] = {
      event  = "InsertEnter",
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
    ["neovim/nvim-lspconfig"] = {
      event  = buf_read,
      config = function()
        require("lsp")
      end,
    },
    ["lewis6991/gitsigns.nvim"] = {
      requires = "nvim-lua/plenary.nvim",
      config   = function()
        require("gitsigns").setup()
      end,
    },
    ["ntpeters/vim-better-whitespace"] = {
      event  = buf_read,
      config = function()
        vim.g.strip_whitespace_confirm = false
        vim.cmd[[autocmd BufEnter * EnableStripWhitespaceOnSave]]
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
    ["hashivim/vim-terraform"] = {
      ft = "terraform",
    },
    ["folke/which-key.nvim"] = {
      event  = buf_read,
      config = function()
        require("which-key").setup{}
      end,
    },
    ["p00f/nvim-ts-rainbow"] = {
      event    = buf_read,
      requires = "neovim/nvim-lspconfig",
      config   = function()
        require("nvim-treesitter.configs").setup {
          rainbow = {
            enable        = true,
            extended_mode = true,
          },
        }
      end,
    },
    ["mfussenegger/nvim-lint"] = {
      event  = buf_read,
      config = function()
        local sh = {"shellcheck"}

        vim.cmd[[autocmd BufEnter,InsertLeave,TextChanged * lua require("lint").try_lint()]]

        require("lint").linters_by_ft = {
          zsh = sh,
          sh  = sh,
        }
      end,
    },
  },
}

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.api.nvim_command("packadd packer.nvim")
end

return require("packer").startup(
  function()
    for _, plugin in pairs(plugins.defaults) do
      use(plugin)
    end

    for plugin, conf in pairs(plugins.with_config) do
      use {
        plugin,
        event    = event,
        cmd      = cmd,
        requires = conf.requires,
        run      = conf.run,
        config   = conf.config,
        ft       = conf.ft,
      }
    end
  end
)
