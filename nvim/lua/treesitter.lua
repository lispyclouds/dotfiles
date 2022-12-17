require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "clojure",
    "go",
    "hcl",
    "javascript",
    "json",
    "markdown",
    "ocaml",
    "python",
    "typescript",
    "yaml",
  },

  highlight = {
    enable = true,
  },
})
