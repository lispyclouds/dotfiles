local fn           = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local buf_read     = "BufRead"
local buf_enter    = "BufEnter"
local plugins      = {
  ["wbthomason/packer.nvim"] = {},
  ["kyazdani42/nvim-web-devicons"] = {},
  ["Pocco81/Catppuccino.nvim"] = { -- colorscheme
    after  = "packer.nvim",
    config = function()
      require("colorscheme")
    end,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    run    = ":TSUpdate",
    branch = "0.5-compat",
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
  ["kyazdani42/nvim-tree.lua"] = {
    cmd = "NvimTreeToggle",
  },
  ["akinsho/nvim-bufferline.lua"] = {
    after  = "nvim-web-devicons",
    config = function()
      require("bufferline").setup{}
    end,
  },
  ["tamton-aquib/staline.nvim"] = {
    after  = "nvim-bufferline.lua",
    config = function()
      require("staline").setup {
        defaults = {
          left_separator  = "",
          right_separator = "",
        },
        sections = {
          left  = {
            " ", "right_sep_double", "-mode", "left_sep_double", " ",
            "right_sep", "-file_name", "left_sep", " ",
            "right_sep_double", "-branch", "left_sep_double", " ",
          },
          mid   = {"lsp"},
          right = {
            "right_sep", "-file_size", "left_sep", " ",
            "right_sep_double", "-line_column", "left_sep_double", " ",
          },
       },
    }
    end,
  },
  ["hrsh7th/nvim-cmp"] = {
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-path",
    },
    config   = function()
      require("cmp").setup {
        sources = {
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "nvim_lua" },
          { name = "path" },
        },
      }
    end,
  },
  ["neovim/nvim-lspconfig"] = {
    event  = buf_enter,
    config = function()
      require("lsp")
    end,
  },
  ["lewis6991/gitsigns.nvim"] = {
    event    = buf_read,
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
  ["famiu/bufdelete.nvim"] = {
    event = buf_enter,
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
    event  = "VimEnter",
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
        zsh        = sh,
        sh         = sh,
        dockerfile = {"hadolint"},
      }
    end,
  },
  ["blackCauldron7/surround.nvim"] = {
    config = function()
      require "surround".setup {
        mappings_style = "surround",
      }
    end,
  },
}

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.api.nvim_command("packadd packer.nvim")
end

return require("packer").startup(
  function(use)
    for plugin, conf in pairs(plugins) do
      use {
        plugin,
        event    = conf.event,
        cmd      = conf.cmd,
        requires = conf.requires,
        run      = conf.run,
        config   = conf.config,
        ft       = conf.ft,
        branch   = conf.branch,
        as       = conf.as,
      }
    end
  end
)
