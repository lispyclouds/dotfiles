return {
  setup = function()
    vim.api.nvim_create_autocmd("BufRead", {
      desc = "Setup LSP",
      group = vim.api.nvim_create_augroup("lispyclouds-setup-lsp", { clear = true }),
      once = true,
      callback = function()
        local lsps = {
          -- https://docs.basedpyright.com/latest/installation/command-line-and-language-server/
          basedpyright = {
            cmd = { "basedpyright-langserver", "--stdio" },
            filetypes = { "python" },
            root_markers = {
              "pyproject.toml",
              "pyrightconfig.json",
              "requirements.txt",
            },
            settings = {
              basedpyright = {
                typeCheckingMode = "standard",
              },
            },
          },
          -- https://clojure-lsp.io/installation/
          clojure_lsp = {
            cmd = { "clojure-lsp" },
            filetypes = { "clojure", "edn" },
            root_markers = {
              "bb.edn",
              "deps.edn",
              "project.clj",
            },
          },
          -- go install golang.org/x/tools/gopls@latest
          gopls = {
            cmd = { "gopls" },
            filetypes = { "go", "gomod", "gowork", "gotmpl" },
            root_markers = { "go.mod" },
            settings = {
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
          },
          -- https://docs.astral.sh/ruff/installation/
          ruff = {
            cmd = { "ruff", "server" },
            filetypes = { "python" },
            root_markers = {
              "pyproject.toml",
              "ruff.toml",
              ".ruff.toml",
            },
          },
          -- npm install --global yaml-language-server
          yamlls = {
            cmd = { "yaml-language-server", "--stdio" },
            filetypes = { "yaml" },
            settings = {
              yaml = { keyOrdering = false },
            },
          },
        }
        local on_attach = function(client, buffer)
          local buf = vim.lsp.buf
          local show_ih = false
          local chars = {}

          for i = 32, 126 do
            table.insert(chars, string.char(i))
          end

          client.server_capabilities.completionProvider.triggerCharacters = chars
          vim.lsp.completion.enable(true, client.id, buffer, { autotrigger = true })

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

        for lsp, opts in pairs(lsps) do
          opts.capabilities = {
            textDocument = {
              completion = {
                completionItem = {
                  commitCharactersSupport = false,
                  deprecatedSupport = true,
                  documentationFormat = { "markdown", "plaintext" },
                  insertTextModeSupport = { valueSet = { 1 } },
                  labelDetailsSupport = true,
                  preselectSupport = false,
                  resolveSupport = {
                    properties = {
                      "documentation",
                      "detail",
                      "additionalTextEdits",
                      "command",
                      "data",
                    },
                  },
                  snippetSupport = true,
                  tagSupport = { valueSet = { 1 } },
                },
                completionList = {
                  itemDefaults = {
                    "commitCharacters",
                    "editRange",
                    "insertTextFormat",
                    "insertTextMode",
                    "data",
                  },
                },
                contextSupport = true,
                insertTextMode = 1,
              },
            },
          }
          opts.on_attach = on_attach
          opts.single_file_support = true

          vim.lsp.config(lsp, opts)
          vim.lsp.enable(lsp)
        end
      end,
    })
  end,
}
