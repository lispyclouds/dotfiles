local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute "packadd packer.nvim"
end

return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"
    use "kyazdani42/nvim-tree.lua"
    use "kyazdani42/nvim-web-devicons"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "vim-airline/vim-airline"
    use "vim-airline/vim-airline-themes"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }
    use {"akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}
    use {"rust-lang/rust.vim", ft = {"rust"}}
    use "ntpeters/vim-better-whitespace"
    use {"hashivim/vim-terraform", ft = {"terraform"}}
    use "dense-analysis/ale"
    use {"neoclide/coc.nvim", branch = "release"}

    use {"liquidz/vim-iced", ft = {"clojure"}}
    use {"guns/vim-sexp", ft = {"clojure"}}
    use {"liquidz/vim-iced-coc-source", ft = {"clojure"}}
    use {"guns/vim-clojure-static", ft = {"clojure"}}
    use {"eraserhd/parinfer-rust", run = {"cargo build --release"}}

    -- Colorscheme
    use "ghifarit53/tokyonight-vim"
  end
)

