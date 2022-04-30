(module persistent_undo)

(local undo-dir (.. vim.env.HOME "/.vim/undodir"))
(local vfn vim.fn)

(when (not (vfn.isdirectory undo-dir))
  (vfn.mkdir undo-dir "" 0700))

(set vim.o.undodir undo-dir)
(set vim.o.undofile true)
