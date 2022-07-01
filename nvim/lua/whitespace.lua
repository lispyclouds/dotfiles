-- See: https://github.com/cappyzawa/trim.nvim/blob/master/lua/trim/config.lua
local patterns = {
  [[%s/\s\+$//e]],
  [[%s/\($\n\s*\)\+\%$//]],
  [[%s/\%^\n\+//]],
}

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save = vim.fn.winsaveview()

    for _, pattern in pairs(patterns) do
      vim.api.nvim_exec(string.format("silent! %s", pattern), false)
    end

    vim.fn.winrestview(save)
  end,
})
