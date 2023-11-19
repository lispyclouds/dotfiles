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
|<img width="890" alt="1" src="https://github.com/lispyclouds/dotfiles/assets/5615588/b080a4bc-2aa4-4021-9566-6b87ae82542d">|<img width="890" alt="2" src="https://github.com/lispyclouds/dotfiles/assets/5615588/28f3bd89-2366-4ddc-89b3-1b8fa760193c">|<img width="890" alt="3" src="https://github.com/lispyclouds/dotfiles/assets/5615588/c6a46a01-0e17-44bf-ae7d-d5835e664bdf">|
|<img width="890" alt="4" src="https://github.com/lispyclouds/dotfiles/assets/5615588/b384f585-4263-4d3b-81de-01f700742143">|<img width="890" alt="5" src="https://github.com/lispyclouds/dotfiles/assets/5615588/ffba64a6-0363-433e-9977-7581ad73b84c">|<img width="890" alt="6" src="https://github.com/lispyclouds/dotfiles/assets/5615588/d688e7a6-808f-4851-b501-4514feb90d00">|

### Bootstrapping new Fedora or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
