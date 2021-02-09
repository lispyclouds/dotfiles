POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

zstyle ':z4h:'                auto-update      'ask'
zstyle ':z4h:'                auto-update-days '7'
zstyle ':z4h:bindkey'         keyboard         'mac'
zstyle ':z4h:fzf-complete'    fzf-bindings     'tab:down'
zstyle ':z4h:cd-down'         fzf-bindings     'tab:down'
zstyle ':z4h:autosuggestions' forward-char     'accept'
zstyle ':z4h:ssh:*'           send-extra-files '~/.iterm2_shell_integration.zsh'
zstyle ':z4h:ssh:some-host'   passthrough      'yes'
zstyle ':zle:up-line-or-beginning-search'   leave-cursor 'yes'
zstyle ':zle:down-line-or-beginning-search' leave-cursor 'yes'

z4h install ohmyzsh/ohmyzsh || return
z4h init || return

export GPG_TTY=$TTY

path=(~/bin $path)

z4h source $Z4H/ohmyzsh/ohmyzsh/lib/diagnostics.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/emoji-clock/emoji-clock.plugin.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/common-aliases/common-aliases.plugin.zsh
fpath+=($Z4H/ohmyzsh/ohmyzsh/plugins/supervisor)
z4h source ~/.iterm2_shell_integration.zsh

autoload -Uz zmv

function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

function ssh() { z4h ssh "$@" }

[[ -n $z4h_win_home ]] && hash -d w=$z4h_win_home

alias tree='tree -a -I .git'

alias ls="${aliases[ls]:-ls} -A"

setopt glob_dots
setopt no_auto_menu

eval "$(thefuck --alias)"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

alias u="brew update                                          && \
         brew upgrade                                         && \
         brew upgrade --cask --greedy                         && \
         brew cleanup -s                                      && \
         rustup self update                           || true && \
         rustup update                                || true && \
         vim +PlugUpgrade +PlugClean +PlugUpdate +CocUpdate +qall"

if [ ! -f ~/.lispy_first_setup_complete ]
then
    sudo ln -s /usr/local/sbin/mount_ntfs "/Volumes/Macintosh HD/sbin/mount_ntfs"

    $(brew --prefix)/opt/fzf/install

    touch ~/.lispy_first_setup_complete
fi

export GOPATH=$HOME/.go
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="$PATH:/usr/local/opt/llvm/bin:\
/Users/$(whoami)/.local/bin:\
/usr/local/opt/ruby/bin:\
/usr/local/bin:\
/Users/$(whoami)/.vim/plugged/vim-iced/bin"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export BAT_STYLE=plain
source $HOME/.cargo/env

alias graal='export JAVA_HOME=$(/usr/libexec/java_home -v 11) && export GRAALVM_HOME=$JAVA_HOME'
alias hotspot='export JAVA_HOME=$(/usr/libexec/java_home)'
alias vim=nvim
alias ping='prettyping --nolegend'
alias cat=bat
alias rc='docker rm -f `docker ps -aq`'
alias ri='docker image rm -f `docker image ls -aq`'
alias dil='docker image ls'
alias dps='docker ps -a'
alias rbl='clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"LATEST\"}}}" -M -m rebel-readline.main'
alias ls=exa

function di() { docker image rm $(docker images -q | head -${1-"1"}) }

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
bindkey "^[[A" fzf-history-widget
