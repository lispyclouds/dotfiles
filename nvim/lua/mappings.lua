vim.g.mapleader = ","

local normal_mappings = {
  ["<Leader><CR>"] = ":noh<CR>",
  ["<Leader>nn"]   = ":NvimTreeToggle<CR>",
  ["<Leader>l"]    = ":BufferLineCycleNext<CR>",
  ["<Leader>h"]    = ":BufferLineCyclePrev<CR>",
  ["<Leader>bc"]   = ":Bwipeout<CR>",
}

for mapping, action in pairs(normal_mappings) do
  vim.api.nvim_set_keymap("n", mapping, action, {noremap = true, silent = true})
end
