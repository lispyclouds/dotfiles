local conf = require("lspconfig")
local lsps = { "clojure_lsp", "terraformls", "pyright", "gopls", "yamlls" }

for _, lsp in pairs(lsps) do
  conf[lsp].setup({})
end
