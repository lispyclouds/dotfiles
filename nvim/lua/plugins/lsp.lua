local buf_read = "BufRead"

return {
  {
    "neovim/nvim-lspconfig",
    event = buf_read,
    config = function()
      local lspconfig = require("lspconfig")
      local lsps = {
        bashls = {}, -- https://github.com/bash-lsp/bash-language-server#installation
        clojure_lsp = {}, -- https://clojure-lsp.io/installation/
        gopls = {}, -- https://pkg.go.dev/golang.org/x/tools/gopls#readme-installation
        ocamllsp = {}, -- opam install merlin ocaml-lsp-server ocamlformat
        pyright = {}, -- https://github.com/microsoft/pyright#installation
        rust_analyzer = {}, -- rustup component add rust-analyzer
        terraformls = {}, -- https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md
        yamlls = { -- npm install -g yaml-language-server
          yaml = {
            keyOrdering = false,
          },
        },
      }

      local on_attach = function(_, buffer)
        local buf = vim.lsp.buf

        require("impl").map({
          ["gd"] = buf.definition,
          ["K"] = {
            action = function()
              vim.diagnostic.open_float(nil, { focus = false })
            end,
            opts = {
              desc = "Show LSP diagnostics",
              buffer = buffer,
            },
          },
          ["<leader>fb"] = {
            action = buf.format,
            opts = {
              desc = "LSP [F]ormat [B]uffer",
              buffer = buffer,
            },
          },
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

      -- add the basic capabilities to cmp
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      for lsp, settings in pairs(lsps) do
        lspconfig[lsp].setup({
          capabilities = capabilities,
          on_attach = on_attach,
          settings = settings,
        })
      end
    end,
  },
}
