export ZSH=~/.oh-my-zsh
export LC_ALL=en_US.UTF-8

eval "$(thefuck --alias)"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"

source $ZSH/oh-my-zsh.sh

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

alias v=vagrant
alias vdu="v destroy -f && v up && v ssh"
alias u="brew update                                          && \
         brew upgrade                                         && \
         brew cu -a -y                                        && \
         brew cleanup -s                                      && \
         git -C $ZSH_CUSTOM/themes/powerlevel10k pull         && \
         rustup self update                           || true && \
         rustup update                                || true && \
         vim +PlugUpgrade +PlugClean +PlugUpdate +qall"

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
/Users/$(whoami)/Library/Python/3.7/bin:\
/Users/$(whoami)/.vim/plugged/vim-iced/bin"
export EDITOR=nvim
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source $HOME/.cargo/env
source $HOME/.poetry/env

alias cc=clang
alias graal='export JAVA_HOME=$(/usr/libexec/java_home -v 11) && export GRAALVM_HOME=$JAVA_HOME'
alias hotspot='export JAVA_HOME=$(/usr/libexec/java_home)'
alias ni='~/Downloads/graalvm/Contents/Home/bin/native-image'
alias vim=nvim
alias ping='prettyping --nolegend'
alias cat='bat -p'
alias rc='docker rm -f `docker ps -aq`'
alias ri='docker image rm -f `docker image ls -aq`'
alias dil='docker image ls'
alias dps='docker ps -a'
alias dir='docker image rm'
alias dr='docker rm'
alias rbl='clojure -Sdeps "{:deps {com.bhauman/rebel-readline {:mvn/version \"LATEST\"}}}" -m rebel-readline.main'
alias ls=exa
alias cljserve='clojure -Sdeps "{:deps {nasus {:mvn/version \"LATEST\"}}}" -m http.server'

di() {
    docker image rm $(docker images -q | head -${1-"1"})
}

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.stuff.sh

# Keep this at the end
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh
