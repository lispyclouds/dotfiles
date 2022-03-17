<div align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width=200 />
</div>

Welcome to my dotfiles, this is my setup on MacOS/Fedora 35+, Neovim 0.6+ and zsh. Also some random configs.

### Setting up Neovim
- Ensure Neovim 0.6+ is [installed](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Ensure a recent version of git is installed
- Make sure a recent Rust [toolchain](https://www.rust-lang.org/tools/install) is present
- Put the `nvim` dir here in `~/.config/` or wherever `XDG_CONFIG_HOME` environment var is pointing to.
- Start neovim with `nvim`
- Run `:PackerSync` to download all the plugins and setup neovim
- Make sure all the installs mentioned in `nvim/lua/lsp.lua` are performed too, remove some if irrelevant
- Profit

To keep all the plugins updated run
```sh
nvim +'autocmd User PackerComplete sleep 100m | qall' +PackerSync +TSUpdate
```

### License
MIT
