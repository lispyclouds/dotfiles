return {
  setup = function()
    local leader = " "

    vim.g.mapleader = leader
    vim.g.maplocalleader = leader

    require("impl").map({
      ["<C-h>"] = "<C-w>h",
      ["<C-j>"] = "<C-w>j",
      ["<C-k>"] = "<C-w>k",
      ["<C-l>"] = "<C-w>l",
      ["H"] = ":tabprevious<CR>",
      ["L"] = ":tabnext<CR>",
      ["c"] = "\"_c", -- blackhole
      ["C"] = "\"_C", -- blackhole
      ["d"] = "\"_d", -- blackhole
      ["D"] = "\"_D", -- blackhole
      ["dd"] = "\"_dd", -- blackhole
      ["<leader>p"] = "\"_dP", -- blackhole
      ["<leader>dd"] = "dd", -- usual
      ["<leader>d"] = "d", -- usual
      ["<leader>D"] = "D", -- usual
      ["<leader><CR>"] = ":noh<CR>",
      ["<leader>bc"] = ":bdelete<CR>",
      ["<leader>bf"] = {
        action = function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        opts = { desc = "[B]rowse [F]iles" },
      },
      ["<leader>f"] = {
        action = function()
          require("mini.pick").builtin.files()
        end,
        opts = { desc = "Find [F]ile" },
      },
      ["<leader>s"] = {
        action = function()
          require("mini.pick").builtin.grep_live()
        end,
        opts = { desc = "[S]earch in files" },
      },
      ["<leader>pm"] = {
        action = function()
          vim.o.relativenumber = not vim.o.relativenumber
        end,
        opts = { desc = "[P]airing [M]ode" },
      },
      ["<leader><leader>"] = {
        action = function()
          require("mini.pick").builtin.buffers()
        end,
        opts = { desc = "Show open buffers" },
      },
      ["<leader>gd"] = {
        action = function()
          require("mini.diff").toggle_overlay()
        end,
        opts = { desc = "[G]it [D]iff" },
      },
    })
  end,
}
