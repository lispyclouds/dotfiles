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
      ["<leader><CR>"] = ":noh<CR>",
      ["<leader>dd"] = "dd", -- usual
      ["<leader>d"] = "d", -- usual
      ["<leader>D"] = "D", -- usual
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
      ["<leader>p"] = "\"_dP", -- blackhole
      ["<leader>pm"] = {
        action = function()
          vim.o.relativenumber = not vim.o.relativenumber
        end,
        opts = { desc = "[P]airing [M]ode" },
      },
      ["<leader>sb"] = {
        action = function()
          require("telescope.builtin").buffers()
        end,
        opts = { desc = "[S]how [B]uffers" },
      },
    })
  end,
}
