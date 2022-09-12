vim.o.background = "dark"
vim.o.termguicolors = true

require("nvim-tundra").setup({
  transparent_background = false,
  plugins = {
    lsp = true,
    treesitter = true,
    cmp = true,
    gitsigns = true,
    telescope = true,
  },
})

vim.cmd("colorscheme tundra")
