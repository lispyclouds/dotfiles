local font_name = "JetBrainsMono Nerd Font Mono"
local default_font_size = 14
local function is_gtk() return vim.g.GtkGuiLoaded == 1 end

if is_gtk() then
  default_font_size = 10
end

return {
  setup = function(undo_dir)
    local encoding = "utf-8"
    local opts = {
      autoindent = true,
      background = "dark",
      backup = false,
      clipboard = "unnamedplus",
      cmdheight = 1,
      completeopt = "menuone,noselect",
      cursorline = true,
      encoding = encoding,
      errorbells = false,
      expandtab = true,
      fileencoding = encoding,
      fileformats = "unix,dos,mac",
      hidden = true,
      history = 1000,
      hlsearch = true,
      ignorecase = true,
      incsearch = true,
      laststatus = 3,
      lazyredraw = true,
      magic = true,
      mat = 2,
      mouse = "nvi",
      number = true,
      relativenumber = true,
      ruler = true,
      scrolloff = 7,
      shiftwidth = 2,
      shortmess = "I",
      showmatch = true,
      showmode = false,
      signcolumn = "yes:1",
      smartindent = true,
      smarttab = true,
      swapfile = false,
      tabstop = 2,
      termguicolors = true,
      timeoutlen = 500,
      undodir = undo_dir,
      undofile = true,
      updatetime = 100,
      visualbell = false,
      wrap = true,
      writebackup = false,
    }

    for opt, val in pairs(opts) do
      vim.o[opt] = val
    end

    if is_gtk() or vim.fn.has("gui_vimr") == 1 then
      local font_size = default_font_size

      if is_gtk() then
        local function resize(size)
          vim.fn.rpcnotify(1, "Gui", "Font", string.format("%s Bold %d", font_name, size))
        end

        vim.fn.rpcnotify(1, "Gui", "Option", "Tabline", 0)
        resize(font_size)

        require("impl").map({
          ["<C-z>"] = {
            action = function()
              font_size = font_size + 1
              resize(font_size)
            end,
            opts = { desc = "[Z]oom in" },
          },
          ["<C-S-z>"] = {
            action = function()
              font_size = font_size - 1
              resize(font_size)
            end,
            opts = { desc = "[Z]oom out" },
          },
          ["Z"] = {
            action = function()
              font_size = default_font_size
              resize(font_size)
            end,
            opts = { desc = "Reset zoom" },
          },
        })
      end
    end

    vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "highlight yanked region temporarily",
      pattern = "*",
      callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 100 }) end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "clean up trailing whitespace before saving",
      pattern = "*",
      callback = function()
        local save = vim.fn.winsaveview()
        -- See: https://github.com/cappyzawa/trim.nvim/blob/master/lua/trim/config.lua
        local patterns = {
          [[%s/\s\+$//e]],
          [[%s/\($\n\s*\)\+\%$//]],
          [[%s/\%^\n\+//]],
        }

        for _, pattern in pairs(patterns) do
          vim.api.nvim_exec(string.format("silent! %s", pattern), false)
        end

        vim.fn.winrestview(save)
      end,
    })
  end,
}
