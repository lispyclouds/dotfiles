return {
  {
    "Olical/conjure",
    ft = "clojure",
    config = function()
      vim.api.nvim_create_autocmd("BufNewFile", {
        group = vim.api.nvim_create_augroup("conjure-log-disable-lsp", { clear = true }),
        pattern = { "conjure-log-*" },
        callback = function(event)
          vim.diagnostic.enable(false, { event.buf })
        end,
        desc = "Conjure Log disable LSP diagnostics",
      })
    end,
  },
  {
    "gpanders/nvim-parinfer",
    ft = "clojure",
    config = function()
      vim.g.parinfer_force_balance = true
    end,
  },
}
