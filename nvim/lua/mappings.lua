vim.g.mapleader = " "
vim.g.maplocalleader = ","

local map = function(mapping, action)
  vim.keymap.set("n", mapping, action, { silent = true })
end

local normal_mappings = {
  ["<Leader><CR>"] = ":noh<CR>",
  ["<Leader>n"] = ":Neotree toggle<CR>",
  ["<Leader>l"] = ":BufferLineCycleNext<CR>",
  ["<Leader>h"] = ":BufferLineCyclePrev<CR>",
  ["<Leader>bc"] = ":Bwipeout<CR>",
  ["<Leader>ff"] = function()
    require("telescope.builtin").find_files()
  end,
  ["<Leader>s"] = function()
    require("telescope.builtin").live_grep()
  end,
  ["<Leader>pm"] = function()
    vim.o.relativenumber = not vim.o.relativenumber
  end,
  ["<Leader>ca"] = function()
    vim.lsp.buf.code_action()
  end,
  ["gd"] = function()
    vim.lsp.buf.definition()
  end,
}

for mapping, action in pairs(normal_mappings) do
  map(mapping, action)
end

local sexp_mappings = {
  [">)"] = "<Plug>(sexp_capture_next_element)",
  ["<("] = "<Plug>(sexp_capture_prev_element)",
  [">("] = "<Plug>(sexp_emit_head_element)",
  ["<)"] = "<Plug>(sexp_emit_tail_element)",
}

for mapping, action in pairs(sexp_mappings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "clojure", "fennel" },
    callback = function()
      map(mapping, action)
    end,
  })
end
