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
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "path" },
        { name = "snippy" },
      },
      snippet = {
        expand = function(args) require("snippy").expand_snippet(args.body) end,
      },
    })
  end,
}
