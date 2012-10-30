#!/bin/bash


while getopts ":f" GETOPTS
do
  case $GETOPTS in
  f)    FORCE=yes
        ;;
  esac
done


DOT_FILES=(
    .zsh .zshenv .zshrc
    .bashrc .bash_profile
    .vim .vimrc .gvimrc
    .vimperatorrc .vimperator
    .emacs.d
    .gitconfig .gitignore_global .gitmodules
    .screenrc
    .tmux.conf
    .tm_properties
)

for file in ${DOT_FILES[@]}
do
    if [ "$FORCE" = "yes" ]; then
        [ -h $HOME/$file ] && unlink $HOME/$file
        [ -f $HOME/$file ] && rm $HOME/$file
        [ -d $HOME/$file ] && rm -rf $HOME/$file
        ln -s $HOME/dotfiles/$file $HOME/$file
    fi
done
