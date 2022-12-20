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

![Screenshot 2022-12-14 at 14 17 06](https://user-images.githubusercontent.com/5615588/207620185-8295d753-1b3e-4533-8544-7e9744ee9011.png)
![Screenshot 2022-12-14 at 14 17 43](https://user-images.githubusercontent.com/5615588/207620205-a91295c5-793d-4ffa-b969-7ed745877096.png)
![Screenshot 2022-12-14 at 14 18 02](https://user-images.githubusercontent.com/5615588/207620218-54385f57-2735-4a90-9b47-f4c0110132d5.png)
![Screenshot 2022-12-14 at 14 18 20](https://user-images.githubusercontent.com/5615588/207620229-6ed30f2d-9929-430a-ad32-830ce131e890.png)
![Screenshot 2022-12-14 at 14 18 37](https://user-images.githubusercontent.com/5615588/207620245-e9c252e4-37ab-4e72-8248-4e64f49d917a.png)
![Screenshot 2022-12-14 at 14 19 30](https://user-images.githubusercontent.com/5615588/207620253-7d875cc2-5ea0-4e77-a3b4-2d6bc4aed3cc.png)

### Bootstrapping new Fedora 35+ or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
