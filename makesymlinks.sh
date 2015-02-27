#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=`pwd`                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="bashrc bash_profile gitconfig git-completion.bash heroku-completion.bash inputrc tmux.conf vim vimrc"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    echo "Moving ~/.$file"
    mv ~/.$file $olddir
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# TODO: symlink sublime preferences
SUBLIME_SETTINGS="$HOME/Library/Application Support/Sublime Text 3/Packages/User/Preferences.sublime-settings"
echo "Moving sublime settings from $SUBLIME_SETTINGS to $olddir"
mv "$SUBLIME_SETTINGS" $olddir
echo "Symlinking sublime settings"
ln -s "$dir/other_setup/sublime/Preferences.sublime-settings" "$SUBLIME_SETTINGS"

# symlink scripts directory
echo "Creating symlink for scripts."
ln -s $dir/scripts /usr/local/bin/scripts

