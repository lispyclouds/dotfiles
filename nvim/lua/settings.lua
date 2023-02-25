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

    if vim.fn.has("gui_running") == 1 or vim.g.neovide then
      local font_name = "JetBrainsMono Nerd Font Mono"
      local font = font_name .. ":h10:b"

      if vim.loop.os_uname().sysname == "Darwin" then font = font_name .. ":h14" end
      vim.o.guifont = font
    end

    -- Specific to nvim-gtk
    if vim.g.GtkGuiLoaded == 1 then
      vim.fn.rpcnotify(1, "Gui", "Font", "JetBrainsMono Nerd Font Mono Bold 10")
      vim.fn.rpcnotify(1, "Gui", "Option", "Tabline", 0)
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
