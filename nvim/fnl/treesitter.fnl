(module treesitter
        {require {confs nvim-treesitter.configs}})

(confs.setup {:ensure_installed ["clojure"
                                 "hcl"
                                 "lua"
                                 "python"
                                 "go"
                                 "json"
                                 "yaml"
                                 "typescript"
                                 "bash"
                                 "javascript"]
              :highlight        {:enabled true}})
