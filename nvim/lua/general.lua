local encoding = "utf-8"

require("impl").setopts({
  encoding = encoding,
  fileencoding = encoding,
  backup = false,
  writebackup = false,
  swapfile = false,
})
