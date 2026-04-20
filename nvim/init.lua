-- disable some inbuilt plugins
for _, p in ipairs({
  "editorconfig",
  "gzip",
  "man",
  "netrw",
  "netrwPlugin",
  "rplugin",
  "shada",
  "tarPlugin",
  "tutor_mode_plugin",
}) do
  vim.g["loaded_" .. p] = 1
end

-- deferred load
vim.schedule(function()
  vim.pack.add({
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/MagicDuck/grug-far.nvim",
    "https://github.com/nvim-mini/mini.nvim",
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  })

  -- fully lazy
  vim.pack.add({
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/Olical/conjure",
    "https://github.com/gpanders/nvim-parinfer",
    "https://github.com/lewis6991/gitsigns.nvim",
  }, { load = function() end })

  -- load on buffer events
  vim.api.nvim_create_autocmd("BufReadPre", {
    once = true,
    callback = function()
      vim.cmd.packadd("gitsigns.nvim")
    end,
  })

  -- theme
  local theme = require("catppuccin")
  theme.setup({
    flavour = "mocha",
    transparent_background = true,
    gitsigns = true,
    grug_far = true,
    mini = { enabled = true },
  })
  theme.load("mocha")

  -- plugin setup
  require("mini.icons").setup()
  require("mini.pick").setup({
    mappings = {
      move_down = "<C-j>",
      move_up = "<C-k>",
    },
  })
  require("statusline")
end)

-- treesitter, managed externally
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "bash",
    "clojure",
    "dockerfile",
    "go",
    "java",
    "json",
    "lua",
    "markdown",
    "python",
    "regex",
    "yaml",
  },
  once = true,
  callback = function()
    vim.treesitter.start()
  end,
})

-- config
require("settings")
require("mappings")
require("lsp")
require("vim._core.ui2").enable({})
