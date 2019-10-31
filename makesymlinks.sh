#!/bin/bash
set -euo pipefail
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir="$(cd "$(dirname "$0")" && pwd -P)"    # dotfiles directory
olddir="${dir}_old"                        # old dotfiles backup directory

do_symlink() {
    local file=$1
    local dest=${2:-}
    if [ -z "$dest" ]; then
        dest="$HOME/.$file"
    fi
    # If file isn't already a link to the right place
    if [ "$(readlink "$dest")" != "$dir/$file" ]; then
        if [ -e "$dest" ]; then
            if [ -e "$olddir/$file" ]; then
                echo "$olddir/$file exists. It will be backed up to '$olddir/$file.old'. If this script is run again, it will be LOST" 1>&2
                mv -f "$olddir/$file" "$olddir/$file.old"
            fi
            mv -f "$dest" "$olddir/$file" || exit $?
        fi
        echo "Creating symlink to $file in home directory"
        ln -sf "$dir/$file" "$dest"
    else
        echo "Symlink exists for $file"
    fi
}

# list of files/folders to symlink in homedir
files=(
    bashrc
    dircolors
    gitconfig
    ideavimrc
    minttyrc
    oh-my-zsh
    tmux.conf
    vim
    vimrc
    zsh-dircolors.config
    zshrc
)

##########

if ! [ -d "$olddir" ]; then
    # create dotfiles_old in homedir
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p "$olddir" || exit $?
    echo "done"
fi

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd "$dir" || exit $?
echo "done"

if command -v git >/dev/null 2>&1; then
    git submodule update --init --recursive
else
    if ! [ -f oh-my-zsh/oh-my-zsh.sh ]; then
        echo "No git found, and git submodules don't appear to exist" >&2
        exit 1
    fi
fi

ln -sf "oh_my_zsh_custom/plugins/zsh-dircolors-solarized/dircolors-solarized/$(cat zsh-dircolors.config)" "dircolors"

if type gnome-terminal &>/dev/null; then
    "$dir/gnome-terminal-colors-solarized/set_dark.sh"
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in "${files[@]}"; do
    do_symlink "$file" "$HOME/.$file"
done

do_symlink "fish_config.fish" "$HOME/.config/fish/config.fish"

# make vim folders
mkdir -p "$HOME/.vimextra/backup"
mkdir -p "$HOME/.vimextra/swap"
mkdir -p "$HOME/.vimextra/undo"

