require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "bash",
    "clojure",
    "fennel",
    "go",
    "hcl",
    "javascript",
    "json",
    "lua",
    "python",
    "typescript",
    "yaml",
  },
  highlight = { enabled = true },
})
