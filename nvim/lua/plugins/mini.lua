return {
  "echasnovski/mini.nvim",
  event = "BufRead",
  lazy = true,
  config = function()
    local next, prev = "<C-j>", "<C-k>"
    local s = vim.keymap.set

    require("mini.bufremove").setup()
    require("mini.files").setup()
    require("mini.icons").setup()
    require("mini.trailspace").setup()
    require("mini.completion").setup()
    require("mini.pick").setup({
      mappings = {
        move_down = next,
        move_up = prev,
      },
      options = {
        use_cache = true,
      },
    })

    -- better mini.completion nav
    s("i", next, [[pumvisible() ? "\<C-n>" : "\]] .. next .. [["]], { expr = true })
    s("i", prev, [[pumvisible() ? "\<C-p>" : "\]] .. prev .. [["]], { expr = true })
  end,
}
