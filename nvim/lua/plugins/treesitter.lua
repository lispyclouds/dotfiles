return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync" },
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "bash",
          "clojure",
          "dockerfile",
          "go",
          "hcl",
          "java",
          "json",
          "lua",
          "markdown",
          "markdown_inline",
          "ocaml",
          "python",
          "rust",
          "sql",
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
