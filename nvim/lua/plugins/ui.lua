local buf_read = "BufRead"

return {
  {
    -- colorscheme
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("catppuccin").load("mocha")
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = buf_read,
    config = true,
  },
  {
    "echasnovski/mini.nvim",
    event = buf_read,
    lazy = true,
    config = function()
      local next, prev = "<C-j>", "<C-k>"
      local s = vim.keymap.set

      require("mini.bufremove").setup()
      require("mini.completion").setup()
      require("mini.files").setup()
      require("mini.trailspace").setup()
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
  },
  {
    "MeanderingProgrammer/markdown.nvim",
    config = true,
    ft = "markdown",
  },
}
