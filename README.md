<div align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width=200 />
</div>

Welcome to my dotfiles, this is my setup on MacOS/Fedora 35+, Neovim 0.8+ and zsh. Also some random configs.

### Setting up Neovim

- Ensure Neovim 0.8+ is [installed](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Ensure a recent version of git is installed
- Copy the `nvim` dir in `~/.config/` or wherever `XDG_CONFIG_HOME` environment var is pointing to.
- Start neovim with `nvim` and follow the bootstrapping messages.
- Make sure all the installs mentioned in [lsp.lua](/nvim/lua/lsp.lua) are performed too. Amend the list to your liking.
- Profit from the **_Blazingly Fast_** startup time optimisations!

### Eye Candy

<img width="1780" alt="Screenshot 2022-12-28 at 13 19 30" src="https://user-images.githubusercontent.com/5615588/209819061-857cf34f-ed16-449b-8fae-ddf5a4b5b7a3.png">
<img width="1780" alt="Screenshot 2022-12-28 at 13 19 42" src="https://user-images.githubusercontent.com/5615588/209819074-f6038f41-d384-4ff9-8bf3-daab3d170744.png">
<img width="1780" alt="Screenshot 2022-12-28 at 13 19 56" src="https://user-images.githubusercontent.com/5615588/209819080-aded81f9-37c3-4d79-b577-94a5c020c8d1.png">
<img width="1780" alt="Screenshot 2022-12-28 at 13 20 13" src="https://user-images.githubusercontent.com/5615588/209819088-8d081574-e5fb-4fc5-990a-aaf9ccef44cf.png">
<img width="1780" alt="Screenshot 2022-12-28 at 13 20 25" src="https://user-images.githubusercontent.com/5615588/209819096-547996f4-b4e7-4ccf-9b54-ddca963a8500.png">
<img width="1780" alt="Screenshot 2022-12-28 at 13 20 48" src="https://user-images.githubusercontent.com/5615588/209819103-ea2b715a-d700-4f44-9c02-efce9a34e1cb.png">

### Bootstrapping new Fedora 35+ or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
