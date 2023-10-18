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
        require("impl").map({
          ["<leader>fb"] = {
            action = vim.lsp.buf.format,
            opts = {
              desc = "LSP [F]ormat [B]uffer",
              buffer = buffer,
            },
          },
          ["<leader>ca"] = ":Lspsaga code_action<CR>",
          ["<leader>d"] = ":Lspsaga show_cursor_diagnostics<CR>",
          ["<leader>h"] = ":Lspsaga hover_doc<CR>",
          ["<leader>r"] = ":Lspsaga rename<CR>",
          ["gd"] = ":Lspsaga goto_definition<CR>",
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
  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    opts = {
      lightbulb = {
        enable = false,
      },
    },
  },
}
