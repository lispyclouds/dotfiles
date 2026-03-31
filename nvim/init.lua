vim.g.parinfer_force_balance = true

vim.pack.add({
  "https://github.com/MagicDuck/grug-far.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/Olical/conjure",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/gpanders/nvim-parinfer",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/scottmckendry/cyberdream.nvim",
})

local undo_dir = vim.loop.os_homedir() .. "/.vim/undodir"
if not vim.fn.isdirectory(undo_dir) then
  vim.fn.mkdir(undo_dir, "", 0700)
end

require("settings").setup(undo_dir)
require("mappings").setup()
require("lsp").setup()

-- plugins

-- theme
local theme = require("cyberdream")
theme.setup({
  cache = true,
  transparent = true,
})
theme.load()

-- treesitter
local ts_parsers = {
  "bash",
  "clojure",
  "dockerfile",
  "go",
  "hcl",
  "java",
  "json",
  "lua",
  "markdown",
  "ocaml",
  "python",
  "rust",
  "sql",
  "terraform",
  "yaml",
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = ts_parsers,
  group = vim.api.nvim_create_augroup("lispyclouds-ts", { clear = true }),
  callback = function()
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

require("nvim-treesitter").install(parsers)

-- statusline
local black = "#080808"
local blue = "#80a0ff"
local cyan = "#79dac8"
local grey = "#303030"
local red = "#ff5189"
local violet = "#d183e8"
local white = "#c6c6c6"
local left_sep, right_sep = "", ""

require("lualine").setup({
  options = {
    theme = {
      normal = {
        a = { fg = black, bg = violet },
        b = { fg = white, bg = grey },
        c = { fg = black, bg = "None" },
      },
      insert = { a = { fg = black, bg = blue } },
      visual = { a = { fg = black, bg = cyan } },
      replace = { a = { fg = black, bg = red } },
      inactive = {
        a = { fg = white, bg = black },
        b = { fg = white, bg = black },
        c = { fg = black, bg = black },
      },
    },
    component_separators = "|",
    section_separators = { left = right_sep, right = left_sep },
  },
  sections = {
    lualine_a = {
      { "mode", separator = { left = left_sep }, right_padding = 2 },
    },
    lualine_b = { { "filename", path = 4 }, "diagnostics" },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { "branch", "filetype", "progress" },
    lualine_z = {
      { "location", separator = { right = right_sep }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
})

-- mini
require("mini.bufremove").setup()
require("mini.icons").setup()

-- clojure
-- TODO: ft clojure

vim.api.nvim_create_autocmd("BufNewFile", {
  group = vim.api.nvim_create_augroup("conjure-log-disable-lsp", { clear = true }),
  pattern = { "conjure-log-*" },
  callback = function(event)
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
  desc = "Conjure Log disable LSP diagnostics",
})
