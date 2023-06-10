local lisps = { "clojure", "fennel" }

return {
  {
    "Olical/conjure",
    ft = { "python", unpack(lisps) },
    config = function()
      vim.api.nvim_create_autocmd("BufNewFile", {
        group = vim.api.nvim_create_augroup("conjure_log_disable_lsp", { clear = true }),
        pattern = { "conjure-log-*" },
        callback = function(event)
          vim.diagnostic.disable(event.buf)
        end,
        desc = "Conjure Log disable LSP diagnostics",
      })
    end,
  },
  {
    "gpanders/nvim-parinfer",
    ft = lisps,
    config = function()
      vim.g.parinfer_force_balance = true
    end,
  },
}
