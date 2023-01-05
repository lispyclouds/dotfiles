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

<img width="890" alt="Screenshot 2023-01-05 at 11 57 27" src="https://user-images.githubusercontent.com/5615588/210775606-23715daa-63c8-4635-ac5d-86c1ff56bfb3.png">
<img width="890" alt="Screenshot 2023-01-05 at 11 57 42" src="https://user-images.githubusercontent.com/5615588/210775617-5bfdeace-55f4-4836-8c02-4e314b7edd9a.png">
<img width="890" alt="Screenshot 2023-01-05 at 11 57 59" src="https://user-images.githubusercontent.com/5615588/210775628-38b0dba2-9bd7-4c15-a30e-46487c84d49c.png">
<img width="890" alt="Screenshot 2023-01-05 at 11 58 21" src="https://user-images.githubusercontent.com/5615588/210775637-38ba0f75-ad78-4e95-8191-9435f67d9cee.png">
<img width="890" alt="Screenshot 2023-01-05 at 11 58 35" src="https://user-images.githubusercontent.com/5615588/210775642-9f9b2476-0982-4f74-93ef-3bea74dc1303.png">
<img width="890" alt="Screenshot 2023-01-05 at 11 58 46" src="https://user-images.githubusercontent.com/5615588/210775651-21681647-1874-45b0-9c21-73b2bd78bcf5.png">
<img width="890" alt="Screenshot 2023-01-05 at 11 59 23" src="https://user-images.githubusercontent.com/5615588/210775658-56db6a65-59d4-4910-bc5e-947c1c290ad8.png">

### Bootstrapping new Fedora 35+ or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
