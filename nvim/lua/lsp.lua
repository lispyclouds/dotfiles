local lspconfig = require("lspconfig")
local nls = require("null-ls")
local lsps = {
  "clojure_lsp", -- https://clojure-lsp.io/installation/
  "gopls", -- https://pkg.go.dev/golang.org/x/tools/gopls#readme-installation
  "pyright", -- https://github.com/microsoft/pyright#installation
  "rust_analyzer", -- rustup component add rust-analyzer
  "terraformls", -- https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md
  "yamlls", -- npm install -g yaml-language-server
}

for _, lsp in pairs(lsps) do
  lspconfig[lsp].setup({})
end

nls.setup({
  sources = {
    nls.builtins.diagnostics.shellcheck.with({
      extra_filetypes = { "zsh" },
    }),
    nls.builtins.diagnostics.hadolint,
  },
})
