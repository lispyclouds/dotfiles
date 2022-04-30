-- See: https://github.com/cappyzawa/trim.nvim/blob/master/lua/trim/config.lua
-- TODO: Move to fennel when bracketed strings work

return {
  patterns = {
    [[%s/\s\+$//e]],
    [[%s/\($\n\s*\)\+\%$//]],
    [[%s/\%^\n\+//]],
  }
}
