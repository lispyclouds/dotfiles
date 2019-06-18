# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

eval "$(thefuck --alias)"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv status)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump sudo)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

alias v=vagrant
alias vdu="v destroy -f && v up && v ssh"
alias u="brew update                                          && \
         brew upgrade                                         && \
         brew cu -a -y                                        && \
         brew cleanup                                         && \
         git -C ~/.emacs.d pull                               && \
         git -C $ZSH_CUSTOM/themes/powerlevel10k pull         && \
         rustup self update                           || true && \
         rustup update                                || true && \
         vim +PlugUpgrade +PlugClean +PlugUpdate +qall"

if [ ! -f ~/.lispy_first_setup_complete ]
then
    sudo ln -s /usr/local/sbin/mount_ntfs "/Volumes/Macintosh HD/sbin/mount_ntfs"

    touch ~/.lispy_first_setup_complete
fi

export GOPATH=$HOME/.go
export JAVA_HOME=$(/usr/libexec/java_home)

export L="G8)-2Taa'ZL&!EK8"

export MP_FULLNAME='Rahul De'
export MP_SITETYPE=max
export PATH="/usr/local/opt/llvm/bin:/Users/$(whoami)/.local/bin:/usr/local/opt/python@2/bin:$PATH"
export EDITOR=nvim
alias cc=clang

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source $HOME/.cargo/env
source $HOME/.poetry/env

alias graal='export JAVA_HOME=~/Downloads/graalvm/Contents/Home && export GRAALVM_HOME=$JAVA_HOME'
alias jvm='export JAVA_HOME=$(/usr/libexec/java_home)'
alias ni='~/Downloads/graalvm/Contents/Home/bin/native-image'
alias vim=nvim
alias play="itermocil clj"
alias ncargo='rustup run nightly cargo'
alias nrustc='rustup run nightly rustc'
alias ping='prettyping --nolegend'
alias cat='bat -p'
alias rc='docker rm -f `docker ps -aq`'
alias ri='docker image rm -f `docker image ls -aq`'
alias dil='docker image ls'
alias dps='docker ps -a'
alias dir='docker image rm'
alias dr='docker rm'

zclone() {
    url="${1}"
    name="${url##*/}"
    dir="${name%.*}"

    mkdir ${dir}
    cd ${dir}
    git init
    git remote add origin ${url}
    git config user.name "Rahul De"
    git config user.email "rahul.de@zalando.de"
    git config user.signingKey "AC8335A1FC063D39BB71DBD7D6959EE451EA8C21"
    git config commit.gpgSign true
    git pull ${url}
}

di() {
    docker image rm $(docker images -q | head -${1-"1"})
}

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS

# Keep this at the end
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
