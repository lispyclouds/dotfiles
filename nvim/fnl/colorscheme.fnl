(module colorscheme
  {require {cat catppuccin}})

(set vim.o.background "dark")
(set vim.o.termguicolors true)

(cat.load {:term_colors  true
           :integrations {:which_key  true
                          :ts_rainbow true}})
