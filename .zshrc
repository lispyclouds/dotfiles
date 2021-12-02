POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

zstyle ':z4h:' auto-update      'no'
zstyle ':z4h:' auto-update-days '28'

zstyle ':z4h:' prompt-at-bottom 'no'
zstyle ':z4h:autosuggestions' forward-char 'accept'
zstyle ':z4h:fzf-complete' recurse-dirs 'no'
zstyle :z4h: start-tmux 'no'

zstyle ':z4h:direnv'         enable 'no'
zstyle ':z4h:direnv:success' notify 'yes'

zstyle ':z4h:ssh:example-hostname1'   enable 'yes'
zstyle ':z4h:ssh:*.example-hostname2' enable 'no'
zstyle ':z4h:ssh:*'                   enable 'no'
zstyle ':z4h:ssh:*' send-extra-files '~/.nanorc' '~/.env.zsh'

z4h install ohmyzsh/ohmyzsh || return

z4h init || return

path=(~/bin $path)

export GPG_TTY=$TTY

z4h source ~/.env.zsh
z4h source ohmyzsh/ohmyzsh/lib/diagnostics.zsh

z4h load ohmyzsh/ohmyzsh/plugins/emoji-clock
z4h load ohmyzsh/ohmyzsh/plugins/git
z4h load ohmyzsh/ohmyzsh/plugins/common-aliases

autoload -Uz zmv

function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -z $z4h_win_home ]] || hash -d w=$z4h_win_home

alias tree='tree -a -I .git'
alias ls="${aliases[ls]:-ls} -A"

setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

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

alias cat=bat
alias rc='podman rm -f `docker ps -aq`'
alias ri='podman image rm -f `podman image ls -aq`'
alias il='podman image ls'
alias cps='podman ps -a'
alias rbl='clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"LATEST\"}}}" -M -m rebel-readline.main'
alias ls=exa
alias repl='clojure -Sdeps "{:deps {nrepl/nrepl {:mvn/version \"RELEASE\"} cider/cider-nrepl {:mvn/version \"RELEASE\"}}}" -M -m nrepl.cmdline --middleware "[\"cider.nrepl/cider-middleware\"]"'
alias nvim_update="nvim +'autocmd User PackerComplete sleep 100m | qall' +PackerSync +TSUpdate"

eval "$(zoxide init zsh)"
source $HOME/.cargo/env


function di() {
  podman image rm $(podman images -q | head -${1-"1"})
}

_bb_tasks() {
    local matches=(`bb tasks | tail -n +3 | cut -f1 -d ' '`)
    compadd -a matches
    _files # autocomplete filenames as well
}

compdef _bb_tasks bb

if [[ `uname` == "Darwin" ]]; then
  zstyle ':z4h:bindkey' keyboard 'mac'
  alias u="brew update                  && \
           brew upgrade                 && \
           brew upgrade --cask --greedy && \
           brew cleanup -s              && \
           rustup self update || true   && \
           rustup update || true        && \
           nvim_update                  && \
           z4h update"
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  if [ ! -f ~/.lispy_first_setup_complete ]; then
    sudo ln -s /usr/local/sbin/mount_ntfs "/Volumes/Macintosh HD/sbin/mount_ntfs"
    $(brew --prefix)/opt/fzf/install
    touch ~/.lispy_first_setup_complete
  fi
else
  zstyle ':z4h:bindkey' keyboard 'pc'
  source /usr/share/fzf/shell/key-bindings.zsh
  alias u="sudo dnf update -y         && \
           rustup self update || true && \
           rustup update || true      && \
           nvim_update                && \
           z4h update"
fi

bindkey "^[[A" fzf-history-widget
