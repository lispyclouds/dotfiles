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
      ["<leader>bc"] = ":bwipeout<CR>",
      ["<leader>bf"] = {
        action = function()
          require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
        end,
        opts = { desc = "[B]rowse [F]iles" },
      },
      ["<leader>ff"] = {
        action = function()
          require("telescope.builtin").find_files()
        end,
        opts = { desc = "[F]ind [F]ile" },
      },
      ["<leader>f"] = {
        action = function()
          require("telescope").extensions.live_grep_args.live_grep_args()
        end,
        opts = { desc = "[F]ind in files" },
      },
      ["<leader>pm"] = {
        action = function()
          vim.o.relativenumber = not vim.o.relativenumber
        end,
        opts = { desc = "[P]airing [M]ode" },
      },
      ["<leader><leader>"] = {
        action = function()
          require("telescope.builtin").buffers()
        end,
        opts = { desc = "Show open buffers" },
      },
    })
  end,
}
