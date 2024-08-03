local db_fts = { "sql", "mysql", "plsql" }

return {
  "kristijanhusak/vim-dadbod-ui",
  dependencies = {
    { "tpope/vim-dadbod", lazy = true },
    { "kristijanhusak/vim-dadbod-completion", ft = db_fts, lazy = true },
  },
  cmd = {
    "DBUI",
    "DBUIToggle",
    "DBUIAddConnection",
    "DBUIFindBuffer",
  },
  init = function()
    vim.g.db_ui_use_nerd_fonts = 1

    vim.api.nvim_create_autocmd("FileType", {
      desc = "set dadbod completion",
      group = vim.api.nvim_create_augroup("lispyclouds-db", { clear = true }),
      pattern = db_fts,
      callback = function()
        vim.opt_local.omnifunc = "vim_dadbod_completion#omni"
      end,
    })
  end,
}
