(module whitespace
        {require {w whitespace_patterns}})

(vim.api.nvim_create_autocmd "BufWritePre"
                             {:pattern  "*"
                              :callback (fn []
                                          (let [ws (require :whitespace)]
                                            (ws.trim)))})

(defn trim
  []
  (let [save (vim.fn.winsaveview)]
    (each [_ pattern (pairs w.patterns)]
          (vim.api.nvim_exec (string.format "silent! %s" pattern) false))

    (vim.fn.winrestview save)))
