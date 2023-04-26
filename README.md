<div align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width=200 />
</div>

Welcome to my dotfiles, this is my setup on MacOS/Fedora 38+, Neovim 0.8+ and zsh. Also some random configs.

### Setting up Neovim

- Ensure Neovim 0.9+ is [installed](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Ensure a recent version of git is installed
- Copy the `nvim` dir in `~/.config/` or wherever `XDG_CONFIG_HOME` environment var is pointing to.
- Start neovim with `nvim` and follow the bootstrapping messages.
- Make sure all the installs mentioned in [lsp.lua](/nvim/lua/lsp.lua) are performed too. Amend the list to your liking.
- Profit from the **_Blazingly Fast_** startup time optimisations!

### Eye Candy

| | | |
|:-:|:-:|:-:|
| <img width="890" alt="1" src="https://user-images.githubusercontent.com/5615588/219899526-8fdd4a82-e3d6-4a29-bd26-defebe0ba876.png"> | <img width="890" alt="2" src="https://user-images.githubusercontent.com/5615588/219899527-56376f4c-f48c-4918-9346-720d3828a868.png"> | <img width="890" alt="3" src="https://user-images.githubusercontent.com/5615588/219899529-a20f823e-72df-4fbe-b78c-0d92833bd6d8.png"> |
| <img width="890" alt="4" src="https://user-images.githubusercontent.com/5615588/219899530-13fdcc2c-2e85-4967-9dd8-42baccfa8ccf.png"> | <img width="890" alt="5" src="https://user-images.githubusercontent.com/5615588/219899532-7104ae08-f72c-4be4-90b7-25f14e926995.png"> | <img width="890" alt="6" src="https://user-images.githubusercontent.com/5615588/219899533-7f8d3786-d2a0-4ef1-b4c9-09f747c0a3a9.png"> |

### Bootstrapping new Fedora or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
