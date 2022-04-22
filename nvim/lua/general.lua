local encoding = "utf-8"

vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0
vim.filetype.add({
  extension = {
    edn = "clojure",
  },
})

vim.o.encoding = encoding
vim.o.fileencoding = encoding
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

local disabled_built_ins = {
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

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 0
end
