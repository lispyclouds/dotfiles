return {
  {
    -- colorscheme
    "rebelot/kanagawa.nvim",
    config = function()
      local kanagawa = require("kanagawa")

      -- TODO: Remove with https://github.com/rebelot/kanagawa.nvim/issues/197
      kanagawa.setup({
        overrides = function(colors)
          return {
            ["@comment.danger"] = { link = "@text.danger" },
            ["@comment.note"] = { link = "@text.note" },
            ["@comment.todo"] = { link = "@text.todo" },
            ["@comment.warning"] = { link = "@text.warning" },
            ["@diff.minus"] = { link = "@text.diff.delete" },
            ["@diff.plus"] = { link = "@text.diff.add" },
            ["@exception"] = { link = "@exception" },
            ["@markup.environment"] = { link = "@text.environment" },
            ["@markup.environment.name"] = { link = "@text.environment.name" },
            ["@markup.heading"] = { link = "@text.title" },
            ["@markup.italic"] = { link = "@text.emphasis" },
            ["@markup.link.label"] = { link = "Identifier" },
            ["@markup.link.url"] = { link = "Special" },
            ["@markup.math"] = { link = "@text.math" },
            ["@markup.quote"] = { link = "@text.quote" },
            ["@markup.raw"] = { link = "@text.literal" },
            ["@markup.strong"] = { link = "@text.strong" },
            ["@string.regexp"] = { link = "@string.regex" },
            ["@string.special.symbol"] = { link = "@symbol" },
            ["@variable.parameter"] = { link = "@parameter" },
          }
        end,
      })
      kanagawa.load()
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "echasnovski/mini.files",
    config = true,
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    config = true,
  },
  {
    "echasnovski/mini.pick",
    config = true,
    lazy = true,
    opts = {
      mappings = {
        move_down = "<C-j>",
        move_up = "<C-k>",
      },
      options = {
        use_cache = true,
      },
    },
  },
}
