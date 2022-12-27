return {
  setup = function()
    local encoding = "utf-8"
    local undo_dir = vim.loop.os_homedir() .. "/.vim/undodir"
    local fn = vim.fn

    if not fn.isdirectory(undo_dir) then fn.mkdir(undo_dir, "", 0700) end

    require("impl").setopts({
      backup = false,
      encoding = encoding,
      fileencoding = encoding,
      swapfile = false,
      undodir = undo_dir,
      undofile = true,
      writebackup = false,
    })
  end,
}
