return {
  "echasnovski/mini.nvim",
  event = "BufRead",
  lazy = true,
  config = function()
    local next, prev = "<C-j>", "<C-k>"
    local s = vim.keymap.set
    local conf = {
      ["mini.bufremove"] = {},
      ["mini.files"] = {},
      ["mini.icons"] = {},
      ["mini.trailspace"] = {},
      ["mini.completion"] = {
        lsp_completion = { source_func = "omnifunc" },
      },
      ["mini.pick"] = {
        mappings = {
          move_down = next,
          move_up = prev,
        },
        options = {
          use_cache = true,
        },
      },
    }

    for plug, opts in pairs(conf) do
      require(plug).setup(opts)
    end

    -- better mini.completion nav
    s("i", next, [[pumvisible() ? "\<C-n>" : "\]] .. next .. [["]], { expr = true })
    s("i", prev, [[pumvisible() ? "\<C-p>" : "\]] .. prev .. [["]], { expr = true })
  end,
}
