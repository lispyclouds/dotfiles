local mappings = {
  ["c"] = '"_c', -- blackhole
  ["C"] = '"_C', -- blackhole
  ["d"] = '"_d', -- blackhole
  ["D"] = '"_D', -- blackhole
  ["dd"] = '"_dd', -- blackhole
  ["H"] = ":BufferLineCyclePrev<CR>",
  ["L"] = ":BufferLineCycleNext<CR>",
  ["<leader>bc"] = ":Bwipeout<CR>",
  ["<leader><CR>"] = ":noh<CR>",
  ["<leader>dd"] = "dd", -- usual
  ["<leader>d"] = "d", -- usual
  ["<leader>D"] = "D", -- usual
  ["<leader>ff"] = {
    action = require("telescope.builtin").find_files,
    opts = {
      desc = "Find Files",
    },
  },
  ["<leader>f"] = {
    action = require("telescope.builtin").live_grep,
    opts = {
      desc = "Live Grep",
    },
  },
  ["<leader>n"] = ":NeoTreeFocusToggle<CR>",
  ["<leader>p"] = '"_dP', -- blackhole
  ["<leader>pm"] = {
    action = function() vim.o.relativenumber = not vim.o.relativenumber end,
    opts = {
      desc = "Pairing Mode",
    },
  },
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("impl").map(mappings)
