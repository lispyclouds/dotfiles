(local pack (require :packer))

(local buf-read "BufRead")
(local buf-enter "BufEnter")
(local vim-enter "VimEnter")
(local lisps ["clojure" "fennel"])

(fn telescope-conf
  []
  (let [t (require :telescope)]
    (t.setup {:pickers {:find_files {:hidden true}}})))

(fn neotree-conf
  []
  (let [nt (require :neo-tree)]
    (nt.setup
      {:filesystem {:use_libuv_file_watcher false
                    :follow_current_file    true
                    :filtered_items         {:hide_dotfiles   false
                                             :hide_gitignored false}}})))

(fn feline-conf
  []
  (let [f (require :feline)]
    (f.setup {:components (require :catppuccin.core.integrations.feline)})))

(fn rainbow-conf
  []
  (let [tc (require :nvim-treesitter.configs)]
    (tc.setup {:rainbow {:enable        true
                         :extended_mode true}})))

(fn nvim-lint-conf
  []
  (let [sh   ["shellcheck"]
        lint (require :lint)]
    (vim.api.nvim_create_autocmd ["BufEnter" "InsertLeave" "TextChanged"]
                                 {:pattern  "*"
                                  :callback (fn []
                                              (lint.try_lint))})
    (set lint.linters_by_ft
         {:zsh        sh
          :sh         sh
          :dockerfile ["hadolint"]})))

(set vim.g.fennel_use_luajit 1) ; for mnacamura/vim-fennel-syntax

(local plugins
       {:wbthomason/packer.nvim          {}
        :rktjmp/hotpot.nvim              {}
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
                                          :config   telescope-conf}
        :nvim-neo-tree/neo-tree.nvim     {:event    buf-enter
                                          :branch   "v2.x"
                                          :requires ["nvim-lua/plenary.nvim" "MunifTanjim/nui.nvim"]
                                          :config   neotree-conf}
        :akinsho/bufferline.nvim         {:event  buf-enter
                                          :after  "nvim-web-devicons"
                                          :config (fn []
                                                    (let [b (require :bufferline)]
                                                      (b.setup {})))}
        :feline-nvim/feline.nvim         {:event  buf-enter
                                          :after  "nvim-web-devicons"
                                          :config feline-conf}
        :hrsh7th/nvim-cmp                {:requires ["hrsh7th/cmp-buffer"
                                                     "hrsh7th/cmp-nvim-lsp"
                                                     "hrsh7th/cmp-nvim-lua"
                                                     "hrsh7th/cmp-path"]
                                          :config   (fn []
                                                      (require :completion))}
        :neovim/nvim-lspconfig           {:event  buf-read
                                          :config (fn []
                                                    (require :lsp))}
        :lewis6991/gitsigns.nvim         {:event    buf-read
                                          :requires ["nvim-lua/plenary.nvim"]
                                          :config   (fn []
                                                      (let [gs (require :gitsigns)]
                                                        (gs.setup {})))}
        :famiu/bufdelete.nvim            {:event buf-read}
        :Olical/conjure                  {:ft lisps}
        :guns/vim-sexp                   {:ft lisps}
        :eraserhd/parinfer-rust          {:ft  lisps
                                          :run "cargo build --release"}
        :mnacamura/vim-fennel-syntax     {:ft "fennel"}
        :hashivim/vim-terraform          {:ft "terraform"}
        :folke/which-key.nvim            {:event  vim-enter
                                          :config (fn []
                                                    (let [wk (require :which-key)]
                                                      (wk.setup {})))}
        :p00f/nvim-ts-rainbow            {:event    vim-enter
                                          :requires ["neovim/nvim-lspconfig"]
                                          :config   rainbow-conf}

        :mfussenegger/nvim-lint          {:event  buf-read
                                          :config nvim-lint-conf}})

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
