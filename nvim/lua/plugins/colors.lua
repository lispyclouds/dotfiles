return {
  {
    "sam4llis/nvim-tundra",
    config = function()
      local tundra = require("nvim-tundra")

      tundra.setup({
        plugins = {
          cmp = true,
          gitsigns = true,
          lsp = true,
          telescope = true,
          treesitter = true,

          context = false,
          dbui = false,
          neogit = false,
          nvimtree = false,
        },
      })

      tundra.load()
    end,
  },
}
