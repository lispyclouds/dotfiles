vim.g.mapleader = ","

vim.api.nvim_set_keymap("n", "<Leader><CR>", ":noh<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>nn", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>l", ":bnext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>h", ":bprevious<CR>", {noremap = true, silent = true})
