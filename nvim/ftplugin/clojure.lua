vim.g.parinfer_force_balance = true

vim.cmd.packadd("nvim-parinfer")
vim.cmd.packadd("conjure")

vim.fn["parinfer#init"]()

vim.api.nvim_create_autocmd("BufNewFile", {
  group = vim.api.nvim_create_augroup("conjure-log-disable-lsp", { clear = true }),
  pattern = { "conjure-log-*" },
  callback = function(event)
    vim.diagnostic.enable(false, { bufnr = event.buf })
  end,
  desc = "Conjure Log disable LSP diagnostics",
})
