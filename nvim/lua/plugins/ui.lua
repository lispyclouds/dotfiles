local buf_read = "BufRead"

return {
  {
    -- colorscheme
    "scottmckendry/cyberdream.nvim",
    config = function()
      theme = require("cyberdream")

      theme.setup({
        cache = true,
        transparent = true,
      })
      theme.load()
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = buf_read,
    config = true,
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    config = true,
    ft = "markdown",
  },
  {
    "MagicDuck/grug-far.nvim",
    config = true,
    lazy = true,
  },
  {
    "saghen/blink.cmp",
    version = "*",
    event = buf_read,
    opts = {
      keymap = {
        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<CR>"] = { "accept", "fallback" },
      },
      sources = {
        cmdline = {},
        default = { "lsp", "path", "buffer" },
      },
      signature = {
        enabled = true,
      },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
        },
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    lazy = true,
    config = function()
      require("fzf-lua").setup({})
    end,
  },
}
