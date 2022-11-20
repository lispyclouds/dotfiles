vim.o.background = "dark"
vim.o.termguicolors = true

require("nvim-tundra").setup({
  transparent_background = false,
  plugins = {
    cmp = true,
    gitsigns = true,
    lsp = true,
    telescope = true,
    treesitter = true,
  },
})

vim.cmd("colorscheme tundra")
