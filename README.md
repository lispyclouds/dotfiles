<div align="center">
  <img src="https://neovim.io/logos/neovim-mark-flat.png" width=200 />
</div>

Welcome to my dotfiles, this is my setup on MacOS/Fedora 35+, Neovim 0.8+ and zsh. Also some random configs.

### Setting up Neovim

- Ensure Neovim 0.8+ is [installed](https://github.com/neovim/neovim/wiki/Installing-Neovim)
- Ensure a recent version of git is installed
- Copy the `nvim` dir in `~/.config/` or wherever `XDG_CONFIG_HOME` environment var is pointing to.
- Start neovim with `nvim`. Ignore the first time boot errors, should be gone from subsequent runs.
- Run `:PackerSync` to download all the plugins and setup neovim.
- Make sure all the installs mentioned in `nvim/lua/lsp.lua` are performed too. Amend the list to your liking.
- Profit from the **_Blazingly Fast_** startup time optimisations! Currently **~20ms**.

To keep all the plugins updated run
```sh
nvim +'autocmd User PackerComplete sleep 100m | qall' +PackerSync +TSUpdate
```

### Eye Candy

![Screenshot from 2022-10-02 15-28-34](https://user-images.githubusercontent.com/5615588/193448674-f4244cfe-8672-415b-b47d-bf0994fb9be4.png)
![Screenshot from 2022-10-02 15-29-02](https://user-images.githubusercontent.com/5615588/193448676-824cccd9-e141-4df2-8185-09ae8614985d.png)
![Screenshot from 2022-10-02 15-29-27](https://user-images.githubusercontent.com/5615588/193448678-d6d5abef-82c2-4d7f-aa21-ef91538892d1.png)
![Screenshot from 2022-10-02 15-30-02](https://user-images.githubusercontent.com/5615588/193448679-ce0b2cfa-a9a6-42e6-bb0c-80245521ab22.png)
![Screenshot from 2022-10-02 15-31-39](https://user-images.githubusercontent.com/5615588/193448682-f61ecef4-9857-4e8f-9ecb-8881588ce393.png)
![Screenshot from 2022-10-02 15-35-52](https://user-images.githubusercontent.com/5615588/193448755-8f9565c1-2a0c-41bc-86a5-7c24ad12d68c.png)

### Bootstrapping new Fedora 35+ or MacOS installations

- Ensure a recent version of [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) is installed
- Ensure a recent version of [Node](https://nodejs.org/en/download/) is installed
- [Only for MacOS] Ensure [Homebrew](https://brew.sh/) is installed.
- Run `ansible-playbook playbooks/fedora.yml` or `ansible-playbook playbooks/mac.yml` from the root of this dir based on the OS.

### License
The [Unlicense](https://unlicense.org/)
