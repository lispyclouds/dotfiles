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

  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
})
