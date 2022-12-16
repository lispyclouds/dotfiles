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
  ["<leader>ca"] = {
    action = function() vim.lsp.buf.code_action() end,
    opts = {
      desc = "LSP Code Action",
    },
  },
  ["<leader><CR>"] = ":noh<CR>",
  ["<leader>dd"] = "dd", -- usual
  ["<leader>d"] = "d", -- usual
  ["<leader>D"] = "D", -- usual
  ["<leader>ff"] = {
    action = function() require("telescope.builtin").find_files() end,
    opts = {
      desc = "Find Files",
    },
  },
  ["<leader>f"] = {
    action = function() require("telescope.builtin").live_grep() end,
    opts = {
      desc = "Live Grep",
    },
  },
  ["<leader>h"] = {
    action = function() vim.lsp.buf.hover() end,
    opts = {
      desc = "Show help",
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
  ["<leader>r"] = {
    action = function() vim.lsp.buf.rename() end,
    opts = {
      desc = "LSP Rename",
    },
  },
}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

for mapping, action in pairs(mappings) do
  local opts = {}

  if type(action) == "table" then
    opts = action["opts"]
    action = action["action"]
  end

  opts["silent"] = true

  vim.keymap.set({ "n", "v" }, mapping, action, opts)
end
