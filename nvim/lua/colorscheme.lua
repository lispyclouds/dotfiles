vim.o.background = "dark"
vim.o.termguicolors = true

vim.g.catppuccin_flavour = "mocha"

require("catppuccin").setup({
  dim_inactive = {
    enabled = true,
  },
  term_colors = true,
  compile = {
    enabled = true,
  },
  integrations = {
    treesitter = true,
    treesitter_context = true,
    native_lsp = {
      enabled = true,
    },
    cmp = true,
    gitsigns = true,
    telescope = true,
    neotree = {
      enabled = true,
      show_root = true,
      transparent_panel = false,
    },
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
  },
})

vim.cmd("colorscheme catppuccin")
