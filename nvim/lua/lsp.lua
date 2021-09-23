local lspconfig = require("lspconfig")

lsps = {
  "clojure_lsp", -- brew install clojure-lsp/brew/clojure-lsp-native
  "terraformls", -- brew install hashicorp/tap/terraform-ls
  "pyright", -- brew install pyright
  "gopls", -- brew install gopls
  "tsserver", -- npm install -g typescript typescript-language-server
  "yamlls", -- npm install -g yaml-language-server
  "dockerls", -- npm install -g dockerfile-language-server-nodejs
  {
    bashls = {
      filetypes = { "sh", "zsh" },
    },
  }, -- npm install -g bash-language-server
}

for _, lsp in pairs(lsps) do
  conf = {}

  if type(lsp) == "table" then
    for custom_lsp, custom_conf in pairs(lsp) do
      lsp = custom_lsp
      conf = custom_conf
    end
  end

  lspconfig[lsp].setup(conf)
end
