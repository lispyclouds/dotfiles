local undo_dir = vim.loop.os_homedir() .. "/.vim/undodir"
local fn = vim.fn

if not fn.isdirectory(undo_dir) then fn.mkdir(undo_dir, "", 0700) end

vim.o.undodir = undo_dir
vim.o.undofile = true
