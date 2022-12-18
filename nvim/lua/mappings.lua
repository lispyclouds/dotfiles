vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("impl").map({
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
    action = function() require("telescope.builtin").find_files() end,
    opts = {
      desc = "[F]ind [F]ile",
    },
  },
  ["<leader>f"] = {
    action = function() require("telescope.builtin").live_grep() end,
    opts = {
      desc = "[F]ind in files",
    },
  },
  ["<leader>n"] = ":NeoTreeFocusToggle<CR>",
  ["<leader>p"] = '"_dP', -- blackhole
  ["<leader>pm"] = {
    action = function() vim.o.relativenumber = not vim.o.relativenumber end,
    opts = {
      desc = "[P]airing [M]ode",
    },
  },
})
