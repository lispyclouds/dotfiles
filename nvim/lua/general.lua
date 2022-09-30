local encoding = "utf-8"

vim.o.encoding = encoding
vim.o.fileencoding = encoding
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

local disabled_builtins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "logipat",
  "netrw",
  "netrwFileHandlers",
  "netrwPlugin",
  "netrwSettings",
  "rrhelper",
  "spec",
  "tar",
  "tarPlugin",
  "vimball",
  "vimballPlugin",
}

for _, plugin in pairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 0
end
