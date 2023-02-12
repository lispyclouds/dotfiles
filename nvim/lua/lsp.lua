return {
  setup = function()
    local lspconfig = require("lspconfig")
    local nls = require("null-ls")
    local lsps = {
      "bashls", -- https://github.com/bash-lsp/bash-language-server#installation
      "clojure_lsp", -- https://clojure-lsp.io/installation/
      "gopls", -- https://pkg.go.dev/golang.org/x/tools/gopls#readme-installation
      "pyright", -- https://github.com/microsoft/pyright#installation
      "ocamllsp", -- opam install ocaml-lsp-server
      "terraformls", -- https://github.com/hashicorp/terraform-ls/blob/main/docs/installation.md
      "yamlls", -- npm install -g yaml-language-server
    }

    local on_attach = function(_, buffer)
      local buf = vim.lsp.buf
      local group = vim.api.nvim_create_augroup("lispyclouds_diagnostics", { clear = true })

      require("impl").map({
        ["gd"] = buf.definition,
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

      -- setup LSP diagnostics as a floating window on hover
      vim.diagnostic.config({
        virtual_text = false,
      })

      vim.api.nvim_create_autocmd("CursorHold", {
        desc = "Show LSP diagnostics on hover in normal mode",
        pattern = "*",
        group = group,
        callback = function() vim.diagnostic.open_float(nil, { focus = false }) end,
      })
    end

    -- setup null-ls
    nls.setup({
      sources = {
        nls.builtins.diagnostics.hadolint,
      },
    })

    -- add the basic capabilities to cmp
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    for _, lsp in pairs(lsps) do
      lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end

    -- setup lua-language-server
    local runtime_path = vim.split(package.path, ";")
    local cmd = "lua-language-server"

    table.insert(runtime_path, "lua/?.lua")
    table.insert(runtime_path, "lua/?/init.lua")

    lspconfig.lua_ls.setup({
      capabilities = capabilities,
      cmd = { cmd },
      on_attach = on_attach,
      settings = {
        Lua = {
          format = {
            enable = true,
            defaultConfig = {
              continuation_indent = "2",
              indent_style = "space",
              indent_size = "2",
              trailing_table_separator = "smart",
            },
          },
          runtime = {
            path = runtime_path,
            version = "LuaJIT",
          },
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
          },
          telemetry = {
            enable = false,
          },
        },
      },
    })
  end,
}
