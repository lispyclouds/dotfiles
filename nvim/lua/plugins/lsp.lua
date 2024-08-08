return {
  "neovim/nvim-lspconfig",
  event = "BufRead",
  config = function()
    local lspconfig = require("lspconfig")
    local lsps = {
      basedpyright = { -- pip install basedpyright
        basedpyright = {
          typeCheckingMode = "standard",
        },
      },
      bashls = {}, -- https://github.com/bash-lsp/bash-language-server#installation
      clojure_lsp = {}, -- https://clojure-lsp.io/installation/
      gopls = { -- https://pkg.go.dev/golang.org/x/tools/gopls#readme-installation
        gopls = {
          hints = {
            assignVariableTypes = true,
            compositeLiteralFields = true,
            compositeLiteralTypes = true,
            constantValues = true,
            functionTypeParameters = true,
            parameterNames = true,
            rangeVariableTypes = true,
          },
        },
      },
      terraformls = {}, -- https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md
      yamlls = { -- npm install -g yaml-language-server
        yaml = {
          keyOrdering = false,
        },
      },
    }
    local on_attach = function(client, buffer)
      local buf = vim.lsp.buf
      local show_ih = false

      require("impl").map({
        ["<leader>fb"] = {
          action = vim.lsp.buf.format,
          opts = {
            desc = "LSP [F]ormat [B]uffer",
            buffer = buffer,
          },
        },
        ["<leader>ca"] = buf.code_action,
        ["<leader>d"] = vim.diagnostic.open_float,
        ["<leader>h"] = buf.hover,
        ["<leader>r"] = buf.rename,
        ["gd"] = buf.definition,
        ["<leader>ih"] = {
          action = function()
            if client.supports_method("textDocument/inlayHint") or client.server_capabilities.inlayHintProvider then
              show_ih = not show_ih
              vim.lsp.inlay_hint.enable(show_ih, { bufnr = buffer })
            else
              vim.notify("Inlay hints are unsupported by this LSP")
            end
          end,
          opts = { desc = "Toggle [I]nlay [H]ints" },
        },
      })
    end
    local lsp_capabilities = { -- see: https://github.com/hrsh7th/cmp-nvim-lsp/blob/main/lua/cmp_nvim_lsp/init.lua#L40
      textDocument = {
        completion = {
          dynamicRegistration = false,
          completionItem = {
            snippetSupport = false,
            commitCharactersSupport = true,
            deprecatedSupport = true,
            preselectSupport = true,
            tagSupport = {
              valueSet = { 1 }, -- Deprecated
            },
            insertReplaceSupport = true,
            resolveSupport = {
              properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
                "sortText",
                "filterText",
                "insertText",
                "textEdit",
                "insertTextFormat",
                "insertTextMode",
              },
            },
            insertTextModeSupport = {
              valueSet = { 1, 2 },
            },
            labelDetailsSupport = true,
          },
          contextSupport = true,
          insertTextMode = 1,
          completionList = {
            itemDefaults = {
              "commitCharacters",
              "editRange",
              "insertTextFormat",
              "insertTextMode",
              "data",
            },
          },
        },
      },
    }

    for lsp, settings in pairs(lsps) do
      lspconfig[lsp].setup({
        capabilities = lsp_capabilities,
        on_attach = on_attach,
        settings = settings,
      })
    end
  end,
}
