return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = true,
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync" },
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "clojure",
          "go",
          "haskell",
          "hcl",
          "java",
          "json",
          "lua",
          "markdown",
          "python",
          "rust",
          "terraform",
          "yaml",
        },
        highlight = {
          additional_vim_regex_highlighting = false,
          enable = true,
        },
      })
    end,
  },
}