vim.g.mapleader      = " "
vim.g.maplocalleader = ","

local normal_mappings = {
  ["<Leader><CR>"] = ":noh<CR>",
  ["<Leader>n"]    = ":NvimTreeToggle<CR>",
  ["<Leader>nf"]   = ":NvimTreeFindFile<CR>",
  ["<Leader>l"]    = ":BufferLineCycleNext<CR>",
  ["<Leader>h"]    = ":BufferLineCyclePrev<CR>",
  ["<Leader>bc"]   = ":Bwipeout<CR>",
  ["<Leader>ff"]   = ":Telescope find_files<CR>",
  ["<Leader>s"]    = ":Telescope live_grep<CR>",
  ["<Leader>b"]    = ":Telescope buffers<CR>",
  ["<Leader>q"]    = ":q<CR>",
  ["<Leader>qa"]   = ":qall<CR>",
  ["<Leader>qq"]   = ":qall!<CR>",
}

for mapping, action in pairs(normal_mappings) do
  vim.api.nvim_set_keymap("n", mapping, action, {noremap = true, silent = true})
end
