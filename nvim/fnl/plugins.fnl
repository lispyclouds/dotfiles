(module plugins
        {require {pack packer}})

(local buf-read "BufRead")
(local buf-enter "BufEnter")
(local vim-enter "VimEnter")
(local lisps ["clojure" "fennel"])

(local
  plugins
  {:wbthomason/packer.nvim          {}
   :Olical/aniseed                  {}
   :lewis6991/impatient.nvim        {}
   :kyazdani42/nvim-web-devicons    {}
   :catppuccin/nvim                 {:as     "catppuccin"
                                     :after  "packer.nvim"
                                     :config (fn []
                                               (require :colorscheme))}
   :nvim-treesitter/nvim-treesitter {:event  buf-enter
                                     :run    ":TSUpdate"
                                     :config (fn []
                                               (require :treesitter))}
   :nvim-telescope/telescope.nvim   {:event    vim-enter
                                     :requires ["nvim-lua/popup.nvim" "nvim-lua/plenary.nvim"]
                                     :config   (fn []
                                                 (local t (require :telescope))
                                                 (t.setup {:pickers {:find_files {:hidden true}}}))}
   :nvim-neo-tree/neo-tree.nvim     {:event    buf-enter
                                     :branch   "v2.x"
                                     :requires ["nvim-lua/plenary.nvim" "MunifTanjim/nui.nvim"]
                                     :config   (fn []
                                                 (local nt (require :neo-tree))
                                                 (nt.setup
                                                   {:filesystem {:use_libuv_file_watcher false
                                                                 :follow_current_file    true
                                                                 :filtered_items         {:hide_dotfiles   false
                                                                                          :hide_gitignored false}}}))}
   :akinsho/bufferline.nvim         {:event  buf-enter
                                     :after  "nvim-web-devicons"
                                     :config (fn []
                                               (local b (require :bufferline))
                                               (b.setup {}))}
   :feline-nvim/feline.nvim         {:event  buf-enter
                                     :after  "nvim-web-devicons"
                                     :config (fn []
                                               (local f (require :feline))
                                               (f.setup {:components (require
                                                                       :catppuccin.core.integrations.feline)}))}
   :hrsh7th/nvim-cmp                {:requires ["hrsh7th/cmp-buffer"
                                                "hrsh7th/cmp-nvim-lsp"
                                                "hrsh7th/cmp-nvim-lua"
                                                "hrsh7th/cmp-path"]
                                     :config   (fn []
                                                 (require :completion))}
   :neovim/nvim-lspconfig           {:event  buf-enter
                                     :config (fn []
                                               (require :lsp))}
   :lewis6991/gitsigns.nvim         {:event    buf-read
                                     :requires ["nvim-lua/plenary.nvim"]
                                     :config   (fn []
                                                 (local gs (require :gitsigns))
                                                 (gs.setup {}))}
   :famiu/bufdelete.nvim            {:event buf-enter}
   :Olical/conjure                  {:ft lisps}
   :guns/vim-sexp                   {:ft lisps}
   :eraserhd/parinfer-rust          {:ft  lisps
                                     :run "cargo build --release"}
   :hashivim/vim-terraform          {:ft "terraform"}
   :folke/which-key.nvim            {:event  vim-enter
                                     :config (fn []
                                               (local wk (require :which-key))
                                               (wk.setup {}))}
   :p00f/nvim-ts-rainbow            {:event    vim-enter
                                     :requires ["neovim/nvim-lspconfig"]
                                     :config   (fn []
                                                 (local tsconf (require :nvim-treesitter.configs))
                                                 (tsconf.setup {:rainbow {:enable        true
                                                                          :extended_mode true}}))}
   :mfussenegger/nvim-lint          {:event  buf-read
                                     :config (fn []
                                               (local sh ["shellcheck"])
                                               (local lint (require :lint))
                                               (vim.api.nvim_create_autocmd ["BufEnter" "InsertLeave" "TextChanged"]
                                                                            {:pattern  "*"
                                                                             :callback (fn []
                                                                                         (lint.try_lint))})
                                               (set lint.linters_by_ft
                                                    {:zsh        sh
                                                     :sh         sh
                                                     :dockerfile ["hadolint"]}))}})

(pack.startup
  (fn [use]
    (each [plugin conf (pairs plugins)]
          (use {1         plugin
                :event    conf.event
                :cmd      conf.cmd
                :requires conf.requires
                :run      conf.run
                :config   conf.config
                :ft       conf.ft
                :branch   conf.branch
                :as       conf.as}))))
