return {
  setup = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "bash",
        "clojure",
        "go",
        "hcl",
        "json",
        "lua",
        "markdown",
        "ocaml",
        "python",
        "terraform",
        "yaml",
      },

      highlight = {
        additional_vim_regex_highlighting = false,
        enable = true,
      },
    })
  end,
}
