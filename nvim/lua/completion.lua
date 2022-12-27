return {
  setup = function()
    local cmp = require("cmp")
    local mapping = cmp.mapping

    cmp.setup({
      mapping = {
        ["<C-j>"] = mapping(mapping.select_next_item(), { "i", "c" }),
        ["<C-k>"] = mapping(mapping.select_prev_item(), { "i", "c" }),
        ["<CR>"] = mapping.confirm({ select = false }),
      },
      sources = {
        { name = "buffer" },
        { name = "luasnip" },
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
      },
      snippet = {
        expand = function(args) require("luasnip").lsp_expand(args.body) end,
      },
    })
  end,
}
