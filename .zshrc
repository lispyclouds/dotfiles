POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

zstyle ':z4h:' auto-update 'no'
zstyle ':z4h:' auto-update-days '28'
zstyle ':z4h:bindkey' keyboard 'pc'
zstyle ':z4h:' start-tmux no
zstyle ':z4h:' term-shell-integration 'yes'
zstyle ':z4h:autosuggestions' forward-char 'accept'
zstyle ':z4h:fzf-complete' recurse-dirs 'no'
zstyle ':z4h:direnv' enable 'no'
zstyle ':z4h:direnv:success' notify 'no'
zstyle ':z4h:ssh:example-hostname1' enable 'no'
zstyle ':z4h:ssh:*' enable 'no'
zstyle ':z4h:ssh:*' send-extra-files '~/.env.zsh'

z4h install ohmyzsh/ohmyzsh || return

z4h init || return

path=(~/bin $path)

z4h source ~/.env.zsh
z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh

z4h load ohmyzsh/ohmyzsh/plugins/emoji-clock
z4h load ohmyzsh/ohmyzsh/plugins/git
z4h load ohmyzsh/ohmyzsh/plugins/common-aliases

autoload -Uz zmv

setopt glob_dots
setopt no_auto_menu
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP

export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export BAT_STYLE=plain
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/config

alias cat=bat
alias c=$(command -v podman || command -v docker || { echo "Warning: Podman or Docker not found." >&2 })
alias rc='c rm -f `c ps -aq`'
alias ri='c image rm -f `c image ls -aq`'
alias il='c image ls'
alias cps='c ps -a'
alias rbl='clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"LATEST\"}}}" -M -m rebel-readline.main'
alias ls=eza
alias repl='clojure -J--enable-preview -Sdeps "{:deps {nrepl/nrepl {:mvn/version \"RELEASE\"} cider/cider-nrepl {:mvn/version \"RELEASE\"}}}" -M -m nrepl.cmdline --middleware "[\"cider.nrepl/cider-middleware\"]"'
alias antq="clojure -Sdeps '{:deps {com.github.liquidz/antq {:mvn/version \"RELEASE\"}}}' -M -m antq.core"
alias task="bb --config ~/code/repos/dotfiles/bb.edn"
alias commit="task commit"
alias nsync='nvim --headless "+Lazy! sync" +TSUpdateSync +qa'
alias vim=nvim
alias tree='eza --git-ignore --tree'

eval "$(zoxide init zsh)"

function di() {
  c image rm $(c images -q | head -${1-"1"})
}

function replace() {
  rg "${1}" --files-with-matches | xargs sed -i "s/${1}/${2}/g"
}

_bb_tasks() {
  local matches=($(bb tasks | tail -n +3 | cut -f1 -d ' '))
  compadd -a matches
  _files # autocomplete filenames as well
}

compdef _bb_tasks bb

function _raw_update() {
  scripts=(
    "https://raw.githubusercontent.com/clojure-lsp/clojure-lsp/master/install"
    "https://download.clojure.org/install/linux-install.sh"
  )

  for script in ${scripts[*]}; do
    sudo bash < <(curl -s ${script})
  done
}

function bb_install() {
  curl -sLO https://raw.githubusercontent.com/babashka/babashka/master/install
  sudo bash install --dev-build
  rm -f install
}

if [[ $(uname) == "Darwin" ]]; then
  zstyle ':z4h:bindkey' keyboard 'mac'
  alias u="brew update && \
           brew upgrade && \
           brew upgrade --cask --greedy && \
           brew cleanup --prune=1 && \
           nsync && \
           ou && \
           npm update -g && \
           z4h update"
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  if [ ! -f ~/.lispy_first_setup_complete ]; then
    sudo ln -s /usr/local/sbin/mount_ntfs "/Volumes/Macintosh HD/sbin/mount_ntfs"
    "$(brew --prefix)/opt/fzf/install"
    touch ~/.lispy_first_setup_complete
  fi
else
  zstyle ':z4h:bindkey' keyboard 'pc'
  z4h source /usr/share/fzf/shell/key-bindings.zsh
  alias u="sudo dnf5 update -y && \
           sudo dnf5 clean packages && \
           flatpak update -y && \
           nsync && \
           _raw_update || true && \
           bb_install && \
           sudo npm update -g  && \
           task linux download nerd-fonts NerdFontsSymbolsOnly && \
           task linux download themes catppuccin-mocha-blue-standard+default && \
           z4h update"
fi

bindkey "^[[A" fzf-history-widget
