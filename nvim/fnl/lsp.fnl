(local conf (require :lspconfig))

(local lsps
       ["clojure_lsp" ; https://clojure-lsp.io/installation/
        "terraformls" ; https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md
        "pyright"     ; https://github.com/microsoft/pyright#installation
        "gopls"       ; https://pkg.go.dev/golang.org/x/tools/gopls#readme-installation
        "yamlls"])    ; npm install -g yaml-language-server

(each [_ lsp (pairs lsps)]
  (let [ls (. conf lsp)]
    (ls.setup {})))
