require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "clojure",
    "go",
    "hcl",
    "javascript",
    "json",
    "python",
    "rust",
    "typescript",
    "yaml",
  },

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "clojure" },
  },
})
