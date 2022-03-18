(ns bootstrap.fedora)

(defn config
  [options]
  {"dnf"     {:prep     (format
                          "install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-%s.noarch.rpm"
                          (options :fedora-version))
              :cmd      "install -y --setopt=install_weak_deps=False --best"
              :packages ["bat"
                         "black"
                         "bottom"
                         "@development-tools"
                         "fontconfig-devel"
                         "freetype-devel"
                         "fzf"
                         "gcc-c++"
                         "gnome-shell-extension-gpaste"
                         "gnome-tweaks"
                         "gpaste"
                         "java-latest-openjdk"
                         "kitty"
                         "libstdc++-devel"
                         "libxcb-devel"
                         "lsd"
                         "neofetch"
                         "neovim"
                         "nodejs"
                         "npm"
                         "numix-icon-theme-circle"
                         "rlwrap"
                         "ShellCheck"
                         "thunderbird"
                         "vlc"
                         "zsh"]}
   "flatpak" {:prep     "remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo"
              :cmd      "install flathub"
              :packages ["com.getferdi.Ferdi"
                         "com.spotify.Client"
                         "org.signal.Signal"
                         "org.telegram.desktop"]}
   "npm"     {:cmd      "install -g"
              :packages ["prettier"
                         "pyright"
                         "yaml-language-server"]}})
