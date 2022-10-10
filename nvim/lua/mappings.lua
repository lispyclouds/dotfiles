local mappings = {
  ["gd"] = function() vim.lsp.buf.definition() end,
  ["H"] = ":BufferLineCyclePrev<CR>",
  ["L"] = ":BufferLineCycleNext<CR>",
  ["<leader>bc"] = ":Bwipeout<CR>",
  ["<leader>ca"] = function() vim.lsp.buf.code_action() end,
  ["<leader>c"] = '"_c',
  ["<leader>C"] = '"_C',
  ["<leader><CR>"] = ":noh<CR>",
  ["<leader>d"] = '"_d',
  ["<leader>D"] = '"_D',
  ["<leader>dd"] = '"_dd',
  ["<leader>d"] = function() vim.lsp.buf.hover() end,
  ["<leader>ff"] = function() require("telescope.builtin").find_files() end,
  ["<leader>f"] = function() require("telescope.builtin").live_grep() end,
  ["<leader>n"] = ":Neotree toggle<CR>",
  ["<leader>pm"] = function() vim.o.relativenumber = not vim.o.relativenumber end,
  ["<leader>r"] = function() vim.lsp.buf.rename() end,
  ["<leader>x"] = '"_x',
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

for mapping, action in pairs(mappings) do
  vim.keymap.set({ "n", "v" }, mapping, action, { silent = true })
end
