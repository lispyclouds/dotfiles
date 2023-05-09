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
| <img width="890" alt="1" src="https://user-images.githubusercontent.com/5615588/237025188-0fa28f40-8773-4865-a2f6-d6e052593ade.png"> | <img width="890" alt="2" src="https://user-images.githubusercontent.com/5615588/237025193-07c15e73-f494-43ec-b450-4720d326fbc6.png"> | <img width="890" alt="3" src="https://user-images.githubusercontent.com/5615588/237025196-f7433b78-f3b7-42ed-8c2a-62222f722649.png"> |
| <img width="890" alt="4" src="https://user-images.githubusercontent.com/5615588/237025199-33399ca7-a11b-473a-8a4d-446106a773d3.png"> | <img width="890" alt="5" src="https://user-images.githubusercontent.com/5615588/237025208-949e0304-28c3-42a2-b3bd-ccbd471f3458.png"> | <img width="890" alt="6" src="https://user-images.githubusercontent.com/5615588/237025212-91738df0-e298-45b7-8b56-552d74cff452.png"> |

### Bootstrapping new Fedora or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
