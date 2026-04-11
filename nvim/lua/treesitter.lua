local ts_parsers = {
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
  pattern = ts_parsers,
  once = true,
  callback = function()
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == "nvim-treesitter" and kind == "update" then
      if not ev.data.active then
        vim.cmd.packadd("nvim-treesitter")
      end
      vim.cmd("TSUpdate")
    end
  end,
})

require("nvim-treesitter").install(parsers)
