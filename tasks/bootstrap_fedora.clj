(ns bootstrap-fedora
  (:require [clojure.string :as s]
            [babashka.process :as p]))

(def fedora-version
  (-> "rpm -E %fedora"
      (p/sh)
      (:out)
      (s/trim-newline)))

(def config
  {"dnf"     {:prep     (format
                          "install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-%s.noarch.rpm"
                          fedora-version)
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
                         "yaml-language-server"]}})

(defn ->cmds
  [manager {:keys [cmd packages prep]}]
  (let [install-cmd (format "%s %s %s"
                            manager
                            cmd
                            (s/join " " packages))]
    (if prep
      [(str manager " " prep) install-cmd]
      [install-cmd])))

(defn get-cmds
  [manager]
  (when (not (contains? config manager))
    (throw (Exception. (format "Unknown package manager: %s. Use one of %s"
                               manager
                               (s/join ", " (keys config))))))
  (->cmds manager (config manager)))

(comment
  (->cmds "manager"
          {:cmd      "install -flag"
           :packages ["foo" "bar"]
           :prep     "prep cmd"})

  (->cmds "manager"
          {:cmd      "install -flag"
           :packages ["foo" "bar"]})

  (:out (p/sh "rpm -E %fedora"))

  (get-cmds "dnf"))
