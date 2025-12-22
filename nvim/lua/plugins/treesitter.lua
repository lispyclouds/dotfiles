return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = "TSUpdate",
  event = "VeryLazy",
  config = function()
    local parsers = {
      "bash",
      "clojure",
      "dockerfile",
      "go",
      "hcl",
      "java",
      "json",
      "lua",
      "markdown",
      "ocaml",
      "python",
      "rust",
      "sql",
      "terraform",
      "yaml",
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = parsers,
      group = vim.api.nvim_create_augroup("lispyclouds-ts", { clear = true }),
      callback = function()
        vim.treesitter.start()
      end,
    })

    require("nvim-treesitter").install(parsers)
  end,
}
