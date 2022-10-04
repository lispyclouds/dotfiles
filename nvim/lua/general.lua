local encoding = "utf-8"
local opts = {
  encoding = encoding,
  fileencoding = encoding,
  backup = false,
  writebackup = false,
  swapfile = false,
}
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

for opt, val in pairs(opts) do
  vim.o[opt] = val
end

for _, plugin in pairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 0
end
