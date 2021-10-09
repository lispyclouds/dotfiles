vim.g.mapleader = " "
vim.g.maplocalleader = ","

local normal_mappings = {
  ["<Leader><CR>"] = ":noh<CR>",
  ["<Leader>n"] = ":NvimTreeToggle<CR>",
  ["<Leader>nf"] = ":NvimTreeFindFile<CR>",
  ["<Leader>l"] = ":BufferLineCycleNext<CR>",
  ["<Leader>h"] = ":BufferLineCyclePrev<CR>",
  ["<Leader>bc"] = ":Bwipeout<CR>",
  ["<Leader>ff"] = ":Telescope find_files<CR>",
  ["<Leader>s"] = ":Telescope live_grep<CR>",
  ["<Leader>b"] = ":Telescope buffers<CR>",
  ["<Leader>q"] = ":q<CR>",
  ["<Leader>qa"] = ":qall<CR>",
  ["<Leader>qq"] = ":qall!<CR>",
  ["<Leader>pm"] = ":lua require('ux').pairing_mode()<CR>",
  ["<Leader>ca"] = ":lua vim.lsp.buf.code_action()<CR>",
  ["gd"] = ":lua vim.lsp.buf.definition()<CR>",
}

for mapping, action in pairs(normal_mappings) do
  vim.api.nvim_set_keymap("n", mapping, action, { noremap = true, silent = true })
end

local sexp_mappings = {
  [">)"] = "sexp_capture_next_element",
  ["<("] = "sexp_capture_prev_element",
  [">("] = "sexp_emit_head_element",
  ["<)"] = "sexp_emit_tail_element",
}

for mapping, action in pairs(sexp_mappings) do
  vim.api.nvim_command("autocmd FileType clojure nmap <buffer> " .. mapping .. " <Plug>(" .. action .. ")")
end
