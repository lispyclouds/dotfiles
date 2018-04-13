# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

source virtualenvwrapper.sh

eval "$(thefuck --alias)"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(virtualenv vi_mode status)
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

ZSH_THEME="powerlevel9k/powerlevel9k"

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
plugins=(git autojump sudo zsh-autosuggestions vi-mode zsh-syntax-highlighting)

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
         brew cleanup                                         && \
         brew cu -a -y                                        && \
         brew cask cleanup                                    && \
         git -C $ZSH/custom/themes/powerlevel9k pull          && \
         rustup self update                           || true && \
         rustup update                                || true && \
         vim +PlugUpdate +qall"

export GOPATH=$HOME/.go
export JAVA_HOME=$(/usr/libexec/java_home)

export L="G8)-2Taa'ZL&!EK8"

export MP_FULLNAME='Rahul De'
export MP_SITETYPE=max
export PATH="/usr/local/opt/llvm/bin:/Users/47/.local/bin:/usr/local/opt/python@2/bin:$PATH"
export EDITOR=nvim
alias cc=clang

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

source $HOME/.cargo/env

alias j8='export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)'
alias vim=nvim
alias play="itermocil clj"
alias c="highlight -O truecolor"
alias ncargo='rustup run nightly cargo'
alias nrustc='rustup run nightly rustc'
alias rc='docker rm -f `docker ps -aq`'
alias ri='docker image rm -f `docker image ls -aq`'

# Compat for vim mode zle
export KEYTIMEOUT=1

# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

alias ltev='. ~/Documents/repos/local/bin/load_cluster_env.sh test && unset CLIQZ_DMZ_GATEWAY'
alias lpev='. ~/Documents/repos/local/bin/load_cluster_env.sh primary && unset CLIQZ_DMZ_GATEWAY'

# Keep this at the end
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
