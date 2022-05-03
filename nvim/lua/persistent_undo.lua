local undo_dir = (vim.env.HOME .. "/.vim/undodir")
local vfn = vim.fn

if not vfn.isdirectory(undo_dir) then
  vfn.mkdir(undo_dir, "", 700)
end

vim.o.undodir = undo_dir
vim.o.undofile = true
