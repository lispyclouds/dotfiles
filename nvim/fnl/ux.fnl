(set vim.o.history 1000)
(set vim.o.scrolloff 7)
(set vim.o.cmdheight 1)
(set vim.o.hidden true)
(set vim.o.ignorecase true)
(set vim.o.wrap true)
(set vim.o.ruler true)
(set vim.o.number true)
(set vim.o.relativenumber true)
(set vim.o.smarttab true)
(set vim.o.expandtab true)
(set vim.o.smartindent true)
(set vim.o.autoindent true)
(set vim.o.cursorline true)
(set vim.o.clipboard "unnamedplus")
(set vim.o.updatetime 250)
(set vim.o.incsearch true)
(set vim.o.hlsearch true)
(set vim.o.inccommand "nosplit")
(set vim.o.lazyredraw true)
(set vim.o.magic true)
(set vim.o.showmatch true)
(set vim.o.mat 2)
(set vim.o.fileformats "unix,dos,mac")
(set vim.o.errorbells false)
(set vim.o.visualbell false)
(set vim.o.timeoutlen 500)
(set vim.o.foldcolumn "1")
(set vim.o.shiftwidth 2)
(set vim.o.tabstop 2)
(set vim.o.completeopt "menuone,noselect")
(set vim.o.shortmess "I")
(set vim.o.mouse "a")
(set vim.o.termguicolors true)
(set vim.o.laststatus 3)

(if (= "Linux" (. (vim.loop.os_uname) "sysname"))
  (set vim.o.guifont "JetBrainsMono Nerd Font Mono:h12")
  (set vim.o.guifont "JetBrainsMono Nerd Font Mono:h14"))

(vim.api.nvim_create_autocmd "TextYankPost"
                             {:pattern  "*"
                              :callback (λ []
                                          (vim.highlight.on_yank {:higroup "IncSearch"
                                                                  :timeout 100}))})

{:pairing-mode (λ
                 []
                 (set vim.o.relativenumber (not vim.o.relativenumber)))}
