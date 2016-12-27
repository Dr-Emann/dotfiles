#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir="$(readlink -f "$(dirname "$0")")"     # dotfiles directory
olddir="${dir}_old"                        # old dotfiles backup directory

# list of files/folders to symlink in homedir
files=(
    bashrc
    dircolors
    vimrc
    vim
    gitconfig
    tmux.conf
    minttyrc
    oh-my-zsh
    zshrc
    zsh-dircolors.config
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

git submodule update --init --recursive

ln -sf "oh_my_zsh_custom/plugins/zsh-dircolors-solarized/dircolors-solarized/$(cat zsh-dircolors.config)" "dircolors"

if type gnome-terminal &>/dev/null; then
    "$dir/gnome-terminal-colors-solarized/set_dark.sh"
fi

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in "${files[@]}"; do
    # If file isn't already a link to the right place
    if [ "$(readlink "$HOME/.$file")" != "$dir/$file" ]; then
        if [ -e "$HOME/.$file" ]; then
            if [ -e "$olddir/$file" ]; then
                echo "$olddir/$file exists. It will be backed up to '$olddir/$file.old'. If this script is run again, it will be LOST" 1>&2
                mv -f "$olddir/$file" "$olddir/$file.old"
            fi
            mv -f "$HOME/.$file" "$olddir/$file" || exit $?
        fi
        echo "Creating symlink to $file in home directory."
        ln -sf "$dir/$file" "$HOME/.$file"
    else
        echo "Symlink exists for $file."
    fi
done

# make vim folders
mkdir -p "$HOME/.vim/backup"
mkdir -p "$HOME/.vim/swap"
mkdir -p "$HOME/.vim/undo"

