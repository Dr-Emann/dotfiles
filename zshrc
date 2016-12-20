# Path to your oh-my-zsh configuration.
ZSH_CUSTOM=$HOME/dotfiles/oh_my_zsh_custom
ZSH=$HOME/.oh-my-zsh

case "$OSTYPE" in
    darwin*)
        IS_OSX="true"
        IS_UNIX_LIKE="true" ;;
    linux-gnu)
        IS_LINUX="true"
        IS_UNIX_LIKE="true" ;;
    cygwin)
        IS_WINDOWS="true" ;;
esac

autoload -U zmv

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dremann"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

if [[ -z "$DREMANN_NO_ALIASES" ]]; then
    # grep/egrep
    alias grep="grep -q --color=auto"
    alias egrep="egrep -q --color=auto"

    [[ -z "$IS_OSX" ]] &&
        alias rm="rm -I"

    alias df="df -h"
    alias du="du -h"
    
    # dir listings
    alias ls="ls -h -F --color=auto"
    alias dir="ls --format=vertical --color=auto"
    alias vdir="ls --format=long --color=auto"
    alias ll="ls -l"
    alias la="ls -A"
    alias l="ls -C -F"

    [[ -n "$IS_LINUX" ]] &&
        alias cp="cp --reflink=auto"
fi

# Set to this to use case-sensitive completion
CASE_SENSITIVE="false"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(wd cargo screen docker docker-compose zsh-dircolors-solarized)
if [ -n "$IS_OSX" ]; then
    plugins+=(brew osx)
fi
if [ -n "$IS_WINDOWS" ]; then
    plugins+=(gitfast)
else
    plugins+=(git zsh-syntax-highlighting)
fi

source $ZSH/oh-my-zsh.sh

export PATH="/usr/local/bin:$PATH"

if [ -d "$HOME/.multirust/toolchains/stable/cargo/bin" ]; then
    export PATH="$HOME/.multirust/toolchains/stable/cargo/bin:$PATH"
fi

# User configuration
if [ -d "$HOME/bin" ] ; then
	export PATH="$HOME/bin:$PATH"
fi
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='vim'

zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

if whence dircolors >/dev/null; then 
    export LS_COLORS
else
    export CLICOLOR=1
    export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD
fi

LESS=-FXR

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

unsetopt sharehistory

if [ -f ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi
