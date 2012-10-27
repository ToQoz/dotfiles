#!/bin/bash


#!/bin/bash

DOT_FILES=( .zsh .zshenv .zshrc .bashrc .bash_profile .vim .vimrc .gvimrc .vimperatorrc .vimperator .emacs.d .gitconfig .gitignore_global .gitmodules .screenrc .tmux.conf .tm_properties )

for file in ${DOT_FILES[@]}
do
    ln -s $HOME/dotfiles/$file $HOME/$file
done
