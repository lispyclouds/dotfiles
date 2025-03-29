<div align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width=200 />
</div>

Welcome to my dotfiles, this is my setup on MacOS/Fedora 39+, Neovim latest and zsh. Also some random configs.

### Setting up Neovim

- Ensure Neovim 0.11+ is [installed](https://github.com/neovim/neovim/blob/master/INSTALL.md)
- Ensure recent versions of git and curl are installed
- Copy the `nvim` dir in `~/.config/` or wherever `XDG_CONFIG_HOME` environment var is pointing to.
- Start neovim with `nvim` and follow the bootstrapping messages.
- Make sure all the installs mentioned in [lsp.lua](/nvim/lua/lsp.lua) are performed too. Amend the list to your liking.
- Profit from the **_Blazingly Fast_** startup time optimisations!

### Bootstrapping new Fedora or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook --ask-become-pass playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License

The [Unlicense](https://unlicense.org/)
