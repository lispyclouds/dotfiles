local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

return require("packer").startup(
  function()
    use "wbthomason/packer.nvim" -- Packer can manage itself
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"nvim-telescope/telescope.nvim", requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}}
    use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons", config = function() require("bufferline").setup{} end}
    use {"rust-lang/rust.vim", ft = {"rust"}}
    use "ntpeters/vim-better-whitespace"
    use {"hashivim/vim-terraform", ft = {"terraform"}}
    use "dense-analysis/ale"
    use {"neoclide/coc.nvim", branch = "release"}
    use {"hoob3rt/lualine.nvim", requires = {"kyazdani42/nvim-web-devicons", opt = true}}
    use {"lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}, config = function() require('gitsigns').setup() end}

    use {"liquidz/vim-iced", ft = {"clojure"}}
    use {"guns/vim-sexp", ft = {"clojure"}}
    use {"liquidz/vim-iced-coc-source", ft = {"clojure"}}
    use {"guns/vim-clojure-static", ft = {"clojure"}}
    use {"eraserhd/parinfer-rust", run = {"cargo build --release"}}

    -- Colorscheme
    use "folke/tokyonight.nvim"
  end
)

