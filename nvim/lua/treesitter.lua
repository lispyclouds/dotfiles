require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "clojure",
    "hcl",
    "lua",
    "python",
    "go",
    "json",
    "yaml",
    "typescript",
    "bash",
    "javascript",
  },

  highlight = {
    enable = true,
  },
})
