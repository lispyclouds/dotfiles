return {
  map = function(mappings)
    for mapping, action in pairs(mappings) do
      local opts = {}

      if type(action) == "table" then
        opts = action["opts"]
        action = action["action"]
      end

      opts["silent"] = true

      vim.keymap.set({ "n", "v" }, mapping, action, opts)
    end
  end,
  setopts = function(opts)
    for opt, val in pairs(opts) do
      vim.o[opt] = val
    end
  end,
}
