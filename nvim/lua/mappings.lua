vim.g.mapleader = " "
vim.g.maplocalleader = ","

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
  ["<Leader>d"] = function()
    vim.lsp.buf.hover()
  end,
  ["<Leader>r"] = function()
    vim.lsp.buf.rename()
  end,
}

for mapping, action in pairs(normal_mappings) do
  vim.keymap.set("n", mapping, action, { silent = true })
end
