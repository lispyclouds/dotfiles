return {
  "echasnovski/mini.nvim",
  event = "BufRead",
  lazy = true,
  config = function()
    require("mini.bufremove").setup()
    require("mini.files").setup()
    require("mini.icons").setup()
    require("mini.trailspace").setup()
  end,
}
