<div align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width=200 />
</div>

Welcome to my dotfiles, this is my setup on MacOS/Fedora 35+, Neovim 0.8+ and zsh. Also some random configs.

### Setting up Neovim

- Ensure Neovim 0.8+ is [installed](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Ensure a recent version of git is installed
- Make sure a recent Rust [toolchain](https://www.rust-lang.org/tools/install) is present.
- Copy the `nvim` dir in `~/.config/` or wherever `XDG_CONFIG_HOME` environment var is pointing to.
- Start neovim with `nvim`. Ignore the first time boot errors, should be gone from subsequent runs.
- Run `:PackerSync` to download all the plugins and setup neovim.
- Make sure all the installs mentioned in `nvim/lua/lsp.lua` are performed too. Amend the list to your liking.
- Profit from the **_Blazingly Fast_** startup time optimisations!

To keep all the plugins updated run
```sh
nvim +'autocmd User PackerComplete sleep 100m | qall' +PackerSync +TSUpdate
```

### Bootstrapping new Fedora 35+ or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
MIT
