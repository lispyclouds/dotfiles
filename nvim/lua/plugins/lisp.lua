local lisps = { "clojure", "fennel" }

return {
  {
    "Olical/conjure",
    ft = { "python", unpack(lisps) },
  },
  {
    "gpanders/nvim-parinfer",
    ft = lisps,
    config = function()
      vim.g.parinfer_force_balance = true
    end,
  },
}
