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

<img width="1780" alt="Screenshot 2022-12-29 at 10 44 13" src="https://user-images.githubusercontent.com/5615588/209940848-b10026e4-1371-4e3f-9b16-ffff551a023c.png">
<img width="1780" alt="Screenshot 2022-12-29 at 10 45 41" src="https://user-images.githubusercontent.com/5615588/209940854-6ad70ed1-7987-4233-a9ba-8541c89bf791.png">
<img width="1780" alt="Screenshot 2022-12-29 at 10 45 46" src="https://user-images.githubusercontent.com/5615588/209940860-cb673638-bef6-4ffd-a845-8e46239c5e63.png">
<img width="1780" alt="Screenshot 2022-12-29 at 10 43 25" src="https://user-images.githubusercontent.com/5615588/209940828-30ac459c-7a0d-46e9-8262-2e98ce5d8576.png">
<img width="1780" alt="Screenshot 2022-12-29 at 10 43 38" src="https://user-images.githubusercontent.com/5615588/209940832-37a697f0-6c9b-426c-be05-6c07d677e065.png">
<img width="1780" alt="Screenshot 2022-12-29 at 10 44 03" src="https://user-images.githubusercontent.com/5615588/209940838-20ec0847-a1dc-4d8c-9ae3-19797ae8455b.png">

### Bootstrapping new Fedora 35+ or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
