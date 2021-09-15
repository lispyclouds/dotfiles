local lspconfig = require("lspconfig")

lsps = {
  "clojure_lsp", -- brew install clojure-lsp/brew/clojure-lsp-native
  "terraformls", -- brew install hashicorp/tap/terraform-ls
  "pyright", -- brew install pyright
  "gopls", -- brew install gopls
  "tsserver", -- npm install -g typescript typescript-language-server
  "yamlls", -- npm install -g yaml-language-server
}

for _, v in pairs(lsps) do
  lspconfig[v].setup({})
end
