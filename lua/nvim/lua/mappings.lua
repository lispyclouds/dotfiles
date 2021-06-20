vim.g.mapleader = ","

vim.api.nvim_set_keymap("n", "<Leader><CR>", ":noh<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>nn", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>l", ":BufferLineCycleNext<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>h", ":BufferLineCyclePrev<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>bc", ":Bwipeout<CR>", {noremap = true, silent = true})
