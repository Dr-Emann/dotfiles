# Path to your oh-my-zsh configuration.
ZSH_CUSTOM=$HOME/dotfiles/oh_my_zsh_custom
ZSH=$HOME/.oh-my-zsh

autoload -U zmv

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dremann"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

set_alias() {
    local alias_name=$1
    local real_prog=$2
    local alias_args=
    shift
    shift
    while [[ "$@" != "" ]]; do
        if ( "$real_prog" --help 2>&1 | "grep" -q -- "${1%=*}" ); then
            alias_args="$alias_args $1"
        fi
        shift
    done
    if [[ "$alias_args" != "" ]]; then
        alias "$alias_name" "$real_prog $alias_args"
    fi
}

# grep/egrep
set_alias grep grep -q --color=auto
set_alias egrep egrep -q --color=auto

# rm
set_alias rm rm -I

set_alias df df -h
set_alias du du -h

set_alias ls ls -h -F --color=tty
set_alias dir ls --format=vertical --color=auto
set_alias vdir ls --format=long --color=auto
set_alias ll ls -l
set_alias la ls -A
set_alias l ls -C -F

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
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration
if [ -d "$HOME/bin" ] ; then
	export PATH=$HOME/bin:/usr/local/bin:$PATH
else
	export PATH=/usr/local/bin:$PATH
fi
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

export EDITOR='vim'

eval `dircolors ~/.dircolors` > /dev/null 2>&1

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

unsetopt sharehistory
