#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=$HOME/dotfiles                    # dotfiles directory
olddir=$HOME/dotfiles_old             # old dotfiles backup directory
files="bashrc dircolors vimrc vim gitconfig tmux.conf minttyrc oh-my-zsh zshrc"    # list of files/folders to symlink in homedir

##########

if ! [ -d "$olddir" ]; then
    # create dotfiles_old in homedir
    echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
    mkdir -p $olddir
    echo "done"
fi

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

git submodule init
git submodule update

$dir/gnome-terminal-colors-solarized/set_dark.sh

ln -s $dir/dircolors-solarized/dircolors.ansi-dark $dir/dircolors

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    if [ -e "$olddir/$file" ]; then
        echo "$olddir/$file exists. It will be backed up to \`$olddir/$file.old\`. If this script is run again, it will be LOST"
        mv "$olddir/$file" "$olddir/$file.old"
    fi
    mv "$HOME/.$file" "$olddir/$file"
    echo "Creating symlink to $file in home directory."
    ln -s "$dir/$file" "$HOME/.$file"
done

# make vim folders
mkdir $HOME/.vim/backup
mkdir $HOME/.vim/swap
mkdir $HOME/.vim/undo

