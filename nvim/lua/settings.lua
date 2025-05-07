return {
  setup = function(undo_dir)
    local encoding = "utf-8"
    local opts = {
      autoindent = true,
      background = "dark",
      backup = false,
      clipboard = "unnamedplus",
      cmdheight = 1,
      completeopt = "menuone,noselect,fuzzy",
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
      shortmess = "Ic",
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
      winborder = "rounded",
      wrap = true,
      writebackup = false,
    }

    for opt, val in pairs(opts) do
      vim.o[opt] = val
    end

    local disabled_global_opts = {
      "loaded_node_provider",
      "loaded_perl_provider",
      "loaded_python3_provider",
      "loaded_ruby_provider",
    }

    for _, opt in ipairs(disabled_global_opts) do
      vim.g[opt] = 0
    end

    vim.diagnostic.config({ virtual_text = true })

    vim.api.nvim_create_autocmd("TextYankPost", {
      desc = "highlight yanked region temporarily",
      group = vim.api.nvim_create_augroup("lispyclouds-hl-yank", { clear = true }),
      callback = function()
        vim.highlight.on_yank()
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePre", {
      desc = "clean up trailing whitespace before saving",
      group = vim.api.nvim_create_augroup("lispyclouds-clean-ws", { clear = true }),
      callback = function()
        require("mini.trailspace").trim()
      end,
    })
  end,
}
