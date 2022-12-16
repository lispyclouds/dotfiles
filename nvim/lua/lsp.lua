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

local on_attach = function(client, buffer)
  require("impl").map({
    ["gd"] = vim.lsp.buf.definition,
    ["<leader>ca"] = {
      action = vim.lsp.buf.code_action,
      opts = {
        desc = "LSP Code Action",
        buffer = buffer,
      },
    },
    ["<leader>h"] = {
      action = vim.lsp.buf.hover,
      opts = {
        desc = "Show Help",
        buffer = buffer,
      },
    },
    ["<leader>r"] = {
      action = vim.lsp.buf.rename,
      opts = {
        desc = "LSP Rename",
        buffer = buffer,
      },
    },
  })
end

for _, lsp in pairs(lsps) do
  lspconfig[lsp].setup({ on_attach = on_attach })
end

nls.setup({
  sources = {
    nls.builtins.diagnostics.shellcheck.with({
      extra_filetypes = { "zsh" },
    }),
    nls.builtins.diagnostics.hadolint,
  },
})
