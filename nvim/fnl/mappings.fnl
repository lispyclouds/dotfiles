(set vim.g.mapleader " ")
(set vim.g.maplocalleader ",")

(λ kmap
  [mapping action]
  (vim.keymap.set "n" mapping action {:silent true}))

(local normal-mappings
       {"<Leader><C>" ":noh<CR>"
        "<Leader>n"   ":Neotree toggle<CR>"
        "<Leader>l"   ":BufferLineCycleNext<CR>"
        "<Leader>h"   ":BufferLineCyclePrev<CR>"
        "<Leader>bc"  ":Bwipeout<CR>"
        "<Leader>ff"  ":Telescope find_files<CR>"
        "<Leader>s"   ":Telescope live_grep<CR>"
        "<Leader>pm"  (λ []
                        (let [ux (require :ux)]
                          (ux.pairing-mode)))
        "<Leader>ca"  (λ []
                        (vim.lsp.buf.code_action))
        "gd"          (λ []
                        (vim.lsp.buf.definition))})

(each [mapping action (pairs normal-mappings)]
  (kmap mapping action))

(local sexp-mappings
       {">)" "<Plug>(sexp_capture_next_element)"
        "<(" "<Plug>(sexp_capture_prev_element)"
        ">(" "<Plug>(sexp_emit_head_element)"
        "<)" "<Plug>(sexp_emit_tail_element)"})

(each [mapping action (pairs sexp-mappings)]
  (vim.api.nvim_create_autocmd "FileType"
                               {:pattern  ["clojure" "fennel"]
                                :callback (λ []
                                            (kmap mapping action))}))
