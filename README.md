<div align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width=200 />
</div>

Welcome to my dotfiles, this is my setup on MacOS/Fedora 38+, Neovim 0.8+ and zsh. Also some random configs.

### Setting up Neovim

- Ensure Neovim 0.9+ is [installed](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Ensure a recent version of git is installed
- Copy the `nvim` dir in `~/.config/` or wherever `XDG_CONFIG_HOME` environment var is pointing to.
- Start neovim with `nvim` and follow the bootstrapping messages.
- Make sure all the installs mentioned in [lsp.lua](/nvim/lua/plugins/lsp.lua) are performed too. Amend the list to your liking.
- Profit from the **_Blazingly Fast_** startup time optimisations!

### Eye Candy

| | | |
|:-:|:-:|:-:|
|<img width="890" alt="1" src="https://github.com/lispyclouds/dotfiles/assets/5615588/7543fda2-61ac-45d6-8fcd-b25a718ce68d">|<img width="890" alt="2" src="https://github.com/lispyclouds/dotfiles/assets/5615588/363c7897-6dc1-4255-8418-8f0fcb5e2b2d">|<img width="890" alt="3" src="https://github.com/lispyclouds/dotfiles/assets/5615588/565a87cf-8e7e-4015-92a4-3c3bfb7273e2">|
|<img width="890" alt="1" src="https://github.com/lispyclouds/dotfiles/assets/5615588/3f367ffd-e388-45ce-9be1-719c942c966d">|<img width="890" alt="2" src="https://github.com/lispyclouds/dotfiles/assets/5615588/73fa9cc8-c69f-4b14-abd6-1b7b43cc1181">|<img width="890" alt="3" src="https://github.com/lispyclouds/dotfiles/assets/5615588/03fb2760-2d74-4c13-9d46-dc8e93eb1402">|

### Bootstrapping new Fedora or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
