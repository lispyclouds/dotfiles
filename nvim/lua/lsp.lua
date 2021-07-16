local lspconfig = require("lspconfig")

lsps = {
  "clojure_lsp",
  "terraformls",
  "pyright",
  "gopls",
}

for _, v in pairs(lsps) do
  lspconfig[v].setup{}
end
