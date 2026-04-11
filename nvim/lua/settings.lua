local undo_dir = vim.uv.os_homedir() .. "/.vim/undodir"
if not vim.fn.isdirectory(undo_dir) then
  vim.fn.mkdir(undo_dir, "", 0700)
end

local opts = {
  background = "dark",
  backup = false,
  clipboard = "unnamedplus",
  completeopt = "menuone,noselect,fuzzy,popup",
  cursorline = true,
  expandtab = true,
  fileencoding = "utf-8",
  fileformats = "unix,dos,mac",
  history = 1000,
  ignorecase = true,
  incsearch = true,
  laststatus = 3,
  mouse = "nvi",
  number = true,
  pumborder = "rounded",
  relativenumber = true,
  scrolloff = 7,
  shiftwidth = 2,
  shortmess = "Ic",
  showmatch = true,
  showmode = false,
  signcolumn = "yes:1",
  smartindent = true,
  swapfile = false,
  tabstop = 2,
  termguicolors = true,
  timeoutlen = 500,
  undodir = undo_dir,
  undofile = true,
  updatetime = 250,
  winborder = "rounded",
  wrap = true,
}

for opt, val in pairs(opts) do
  vim.o[opt] = val
end

for _, opt in ipairs({
  "loaded_node_provider",
  "loaded_perl_provider",
  "loaded_python3_provider",
  "loaded_ruby_provider",
}) do
  vim.g[opt] = 0
end

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "highlight yanked region temporarily",
  group = vim.api.nvim_create_augroup("lispyclouds-hl-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "clean up trailing whitespace before saving",
  group = vim.api.nvim_create_augroup("lispyclouds-clean-ws", { clear = true }),
  callback = function()
    require("mini.trailspace").trim()
  end,
})
