local buf_read = "BufRead"
local buf_enter = "BufEnter"
local vim_enter = "VimEnter"
local lisps = { "clojure", "fennel" }

local function telescope_conf()
  require("telescope").setup({ pickers = { find_files = { hidden = true } } })
end

local function neotree_conf()
  require("neo-tree").setup({
    filesystem = {
      use_libuv_file_watcher = false,
      follow_current_file = true,
      filtered_items = { hide_dotfiles = false, hide_gitignored = false },
    },
  })
end

local function feline_conf()
  require("feline").setup({ components = require("catppuccin.core.integrations.feline") })
end

local function rainbow_conf()
  require("nvim-treesitter.configs").setup({ rainbow = { enable = true, extended_mode = true } })
end

local function nvim_lint_conf()
  local sh = { "shellcheck" }
  local lint = require("lint")

  vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "TextChanged" }, {
    pattern = "*",
    callback = function()
      lint.try_lint()
    end,
  })

  lint.linters_by_ft = {
    zsh = sh,
    sh = sh,
    dockerfile = { "hadolint" },
  }
end

local plugins = {
  ["wbthomason/packer.nvim"] = {},
  ["rktjmp/hotpot.nvim"] = {},
  ["kyazdani42/nvim-web-devicons"] = {},
  ["catppuccin/nvim"] = {
    as = "catppuccin",
    config = function()
      require("colorscheme")
    end,
  },
  ["nvim-treesitter/nvim-treesitter"] = {
    event = buf_enter,
    run = ":TSUpdate",
    config = function()
      require("treesitter")
    end,
  },
  ["nvim-telescope/telescope.nvim"] = {
    event = vim_enter,
    requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
    config = telescope_conf,
  },
  ["nvim-neo-tree/neo-tree.nvim"] = {
    event = buf_enter,
    branch = "v2.x",
    requires = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    config = neotree_conf,
  },
  ["akinsho/bufferline.nvim"] = {
    event = buf_enter,
    config = function()
      require("bufferline").setup({})
    end,
  },
  ["feline-nvim/feline.nvim"] = { event = buf_enter, config = feline_conf },
  ["hrsh7th/nvim-cmp"] = {
    requires = { "hrsh7th/cmp-buffer", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-nvim-lua", "hrsh7th/cmp-path" },
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
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },
  ["famiu/bufdelete.nvim"] = { event = buf_read },
  ["Olical/conjure"] = { ft = lisps },
  ["guns/vim-sexp"] = { ft = lisps },
  ["eraserhd/parinfer-rust"] = { ft = lisps, run = "cargo build --release" },
  ["mnacamura/vim-fennel-syntax"] = {
    ft = "fennel",
    config = function()
      vim.g.fennel_use_luajit = 1
    end,
  },
  ["hashivim/vim-terraform"] = { ft = "terraform" },
  ["folke/which-key.nvim"] = {
    event = vim_enter,
    config = function()
      require("which-key").setup({})
    end,
  },
  ["p00f/nvim-ts-rainbow"] = { event = vim_enter, requires = { "neovim/nvim-lspconfig" }, config = rainbow_conf },
  ["mfussenegger/nvim-lint"] = { event = buf_read, config = nvim_lint_conf },
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
