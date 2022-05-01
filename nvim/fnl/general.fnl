(local encoding "utf-8")

(set vim.o.encoding encoding)
(set vim.o.fileencoding encoding)
(set vim.o.backup false)
(set vim.o.writebackup false)
(set vim.o.swapfile false)

(local disabled-builtins
       ["netrw"
        "netrwPlugin"
        "netrwSettings"
        "netrwFileHandlers"
        "tar"
        "tarPlugin"
        "getscript"
        "getscriptPlugin"
        "vimball"
        "vimballPlugin"
        "2html_plugin"
        "logipat"
        "rrhelper"
        "spec"])

(each [_ plugin (pairs disabled-builtins)]
  (tset vim.g (.. "loaded_" plugin) 0))
