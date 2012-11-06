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

case "${OSTYPE}" in
darwin*)
    if [ -d $HOME/Library/Application\ Support/KeyRemap4MacBook ]; then
        [ -L $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml ] && unlink $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml
        if [ -f $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml ]; then
            echo "remove $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml. and backup in $BACKUP_DIR/keyremap4macbook_private.xml"
            mv $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml $BACKUP_DIR/keyremap4macbook_private.xml
        fi
        ln -s $HOME/dotfiles/osx/keyremap4macbook/private.xml $HOME/Library/Application\ Support/KeyRemap4MacBook/private.xml
    fi
    ;;
linux*)
    ;;
esac
