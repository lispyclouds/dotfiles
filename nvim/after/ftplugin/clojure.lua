vim.g.parinfer_force_balance = true

vim.api.nvim_create_autocmd("BufNewFile", {
  group = vim.api.nvim_create_augroup("conjure-log-disable-lsp", { clear = true }),
  pattern = { "conjure-log-*" },
  callback = function(event)
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
  desc = "Conjure Log disable LSP diagnostics",
})
