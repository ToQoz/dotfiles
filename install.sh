#!/bin/bash

operation() {
    while getopts ":f" GETOPTS
    do
      case "${GETOPTS}" in
      f)    export FORCE=yes
            ;;
      esac
    done

    case "${OSTYPE}" in
    darwin*)
        setup_keyremap4macbook
        ;;
    linux*)
        ;;
    esac

    echo "You should run $ vim -c \"BundleInstall\""
}

setup_basic() {
    DOT_FILES=(
        .zsh .zshenv .zshrc
        .bashrc .bash_profile
        .vim .vimrc .gvimrc
        .vimperatorrc .vimperator
        .emacs.d
        .gitconfig .gitignore_global
        .tigrc
        .screenrc
        .tmux.conf
        .tm_properties
        .railsrc
        .pryrc
    )

    for file in ${DOT_FILES[@]}
    do
        if [ "$FORCE" = "yes" ]; then
            [ -h ~/$file ] && unlink ~/$file
            [ -f ~/$file ] && rm ~/$file
            [ -d ~/$file ] && rm -rf ~/$file
        fi
        ln -s ~/dotfiles/$file ~/$file
    done
}

# for osx
setup_keyremap4macbook() {
    K4M_DIR=~/Library/Application\ Support/KeyRemap4MacBook
    if [ "$FORCE" = "yes" ]; then
        [ !-d $K4M_DIR ] return
        [ -L $K4M_DIR/private.xml ] && unlink $K4M_DIR/private.xml
        [ -f $K4M_DIR/private.xml ] && rm $K4M_DIR/private.xml
    fi
    ln -s ~/dotfiles/osx/keyremap4macbook/private.xml $K4M_DIR/private.xml
}

# for osx
install_brew() {
    [ -d ~/brew ] && return
    cd ~
    mkdir brew && curl -L https://github.com/mxcl/homebrew/tarball/master | tar xz --strip 1 -C brew
}

operation $@
