local lspconfig = require("lspconfig")
local nls = require("null-ls")
local lsps = {
  "bashls", -- https://github.com/bash-lsp/bash-language-server#installation
  "clojure_lsp", -- https://clojure-lsp.io/installation/
  "gopls", -- https://pkg.go.dev/golang.org/x/tools/gopls#readme-installation
  "pyright", -- https://github.com/microsoft/pyright#installation
  "ocamllsp", -- opam install ocaml-lsp-server
  "ruff_lsp", -- pip install ruff-lsp
  "terraformls", -- https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md
  "yamlls", -- npm install -g yaml-language-server
}

local on_attach = function(client, buffer)
  local buf = vim.lsp.buf

  require("impl").map({
    ["gd"] = buf.definition,
    ["<leader>ca"] = {
      action = buf.code_action,
      opts = {
        desc = "LSP [C]ode [A]ction",
        buffer = buffer,
      },
    },
    ["<leader>h"] = {
      action = buf.hover,
      opts = {
        desc = "Show [H]elp",
        buffer = buffer,
      },
    },
    ["<leader>r"] = {
      action = buf.rename,
      opts = {
        desc = "LSP [R]ename",
        buffer = buffer,
      },
    },
  })
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()

for _, lsp in pairs(lsps) do
  lspconfig[lsp].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end

nls.setup({
  sources = {
    nls.builtins.diagnostics.hadolint,
  },
})
