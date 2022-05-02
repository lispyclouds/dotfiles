; See: https://github.com/cappyzawa/trim.nvim/blob/master/lua/trim/config.lua
(local patterns
       ["%s/\\s\\+$//e"
        "%s/\\($\\n\\s*\\)\\+\\%$//"
        "%s/\\%^\\n\\+//"])

(vim.api.nvim_create_autocmd "BufWritePre"
                             {:pattern  "*"
                              :callback #(let [save (vim.fn.winsaveview)]
                                           (each [_ pattern (pairs patterns)]
                                             (vim.api.nvim_exec (string.format "silent! %s" pattern) false))
                                           (vim.fn.winrestview save))})
