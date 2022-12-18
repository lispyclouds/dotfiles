local encoding = "utf-8"
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

require("impl").setopts({
  encoding = encoding,
  fileencoding = encoding,
  backup = false,
  writebackup = false,
  swapfile = false,
})

for _, plugin in pairs(disabled_builtins) do
  vim.g["loaded_" .. plugin] = 0
end
