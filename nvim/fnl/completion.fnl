(local cmp (require :cmp))

(cmp.setup {:mapping {"<Up>"   (cmp.mapping (cmp.mapping.select_prev_item) ["i" "c"])
                      "<Down>" (cmp.mapping (cmp.mapping.select_next_item) ["i" "c"])
                      "<CR>"   (cmp.mapping.confirm {:select true})}
            :sources [{:name "nvim_lsp"}
                      {:name "buffer"}
                      {:name "nvim_lua"}
                      {:name "path"}]})
