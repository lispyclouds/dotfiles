(local confs (require :nvim-treesitter.configs))

(confs.setup {:ensure_installed ["bash"
                                 "clojure"
                                 "fennel"
                                 "go"
                                 "hcl"
                                 "javascript"
                                 "json"
                                 "lua"
                                 "python"
                                 "typescript"
                                 "yaml"]
              :highlight        {:enabled true}})
