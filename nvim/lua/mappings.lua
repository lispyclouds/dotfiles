local mappings = {
  ["c"] = '"_c', -- blackhole
  ["C"] = '"_C', -- blackhole
  ["d"] = '"_d', -- blackhole
  ["D"] = '"_D', -- blackhole
  ["dd"] = '"_dd', -- blackhole
  ["gd"] = function() vim.lsp.buf.definition() end,
  ["H"] = ":BufferLineCyclePrev<CR>",
  ["L"] = ":BufferLineCycleNext<CR>",
  ["<leader>bc"] = ":Bwipeout<CR>",
  ["<leader>ca"] = function() vim.lsp.buf.code_action() end,
  ["<leader><CR>"] = ":noh<CR>",
  ["<leader>dd"] = "dd", -- usual
  ["<leader>d"] = "d", -- usual
  ["<leader>D"] = "D", -- usual
  ["<leader>ff"] = function() require("telescope.builtin").find_files() end,
  ["<leader>f"] = function() require("telescope.builtin").live_grep() end,
  ["<leader>h"] = function() vim.lsp.buf.hover() end,
  ["<leader>n"] = ":NeoTreeFocusToggle<CR>",
  ["<leader>pm"] = function() vim.o.relativenumber = not vim.o.relativenumber end,
  ["<leader>r"] = function() vim.lsp.buf.rename() end,
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

for mapping, action in pairs(mappings) do
  vim.keymap.set({ "n", "v" }, mapping, action, { silent = true })
end
