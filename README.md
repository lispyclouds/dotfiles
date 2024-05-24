<div align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width=200 />
</div>

Welcome to my dotfiles, this is my setup on MacOS/Fedora 39+, Neovim latest and zsh. Also some random configs.

### Setting up Neovim

- Ensure Neovim 0.10+ is [installed](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Ensure a recent version of git is installed
- Copy the `nvim` dir in `~/.config/` or wherever `XDG_CONFIG_HOME` environment var is pointing to.
- Start neovim with `nvim` and follow the bootstrapping messages.
- Make sure all the installs mentioned in [lsp.lua](/nvim/lua/plugins/lsp.lua) are performed too. Amend the list to your liking.
- Profit from the **_Blazingly Fast_** startup time optimisations!

### Eye Candy

| | | |
|:-:|:-:|:-:|
|<img width="890" alt="1" src="https://github.com/lispyclouds/dotfiles/assets/5615588/453ddee8-9fb6-468e-9c16-d573a8969dbe">|<img width="890" alt="2" src="https://github.com/lispyclouds/dotfiles/assets/5615588/28f3bd89-2366-4ddc-89b3-1b8fa760193c">|<img width="890" alt="3" src="https://github.com/lispyclouds/dotfiles/assets/5615588/c6a46a01-0e17-44bf-ae7d-d5835e664bdf">|
|<img width="890" alt="4" src="https://github.com/lispyclouds/dotfiles/assets/5615588/b384f585-4263-4d3b-81de-01f700742143">|<img width="890" alt="5" src="https://github.com/lispyclouds/dotfiles/assets/5615588/aa7661cd-c59a-4e8a-aa37-e3b7e8435f3c)">|<img width="890" alt="6" src="https://github.com/lispyclouds/dotfiles/assets/5615588/6873ce69-1f71-4885-969d-459b4b1e43c3">|

### Bootstrapping new Fedora or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook --ask-become-pass playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
