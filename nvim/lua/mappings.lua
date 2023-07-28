return {
  setup = function()
    local leader = " "

    vim.g.mapleader = leader
    vim.g.maplocalleader = leader

    require("impl").map({
      ["<leader>bf"] = ":Neotree toggle<CR>",
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
      ["<leader>af"] = {
        action = function()
          require("harpoon.mark").add_file()
        end,
        opts = { desc = "[A]dd [F]ile" },
      },
      ["<leader>lf"] = {
        action = function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        opts = { desc = "[L]ist [F]iles" },
      },
      ["H"] = {
        action = function()
          require("harpoon.ui").nav_prev()
        end,
        opts = { desc = "Prev File" },
      },
      ["L"] = {
        action = function()
          require("harpoon.ui").nav_next()
        end,
        opts = { desc = "Next File" },
      },
    })
  end,
}
