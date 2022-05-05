local encoding = "utf-8"

vim.o.encoding = encoding
vim.o.fileencoding = encoding
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.shadafile = "NONE"

local disabled_builtins = {
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "tar",
  "tarPlugin",
  "getscript",
  "getscriptPlugin",
  "vimball",
  "vimballPlugin",
  "2html_plugin",
  "logipat",
  "rrhelper",
  "spec",
}

for _, plugin in pairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 0
end
