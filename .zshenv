# Skip global compinit on ubuntu systems.
skip_global_compinit=true

# Term
([ -z $TMUX ] && export TERM=xterm-256color) || export TERM=screen-256color

# Lang
export LANG=ja_JP.UTF-8
export LC_All=ja_JP.UTF-8

# Dir {{{
export ZSH_D=$HOME/.zsh
export PRIVATE_D=$HOME/private
export BREW_HOME=$HOME/brew
export RBENV_HOME=$HOME/.rbenv
export GUI_APP=/Applications
if [ -d $BREW_HOME/opt/rsense ]; then
  export RSENSE_HOME=$BREW_HOME/opt/rsense/libexec/
elif [ -d $HOME/opt/rsense ]; then
  export RSENSE_HOME=$HOME/opt/rsense
elif [ -d /opt/rsense ]; then
  export RSENSE_HOME=/opt/rsense
fi
# }}}

if [ -d $BREW_HOME ]; then
  export LDFLAGS="-L$BREW_HOME/opt/gettext/lib -L$BREW_HOME/opt/sqlite/lib -L$BREW_HOME/opt/libxml2/lib -L$BREW_HOME/lib $LDFLAGS"
  export CPPFLAGS="-I$BREW_HOME/opt/gettext/include -I$BREW_HOME/opt/sqlite/include -I$BREW_HOME/opt/libxml2/include -isystem $BREW_HOME/include $CPPFLAGS"
  export PKG_CONFIG_PATH="$BREW_HOME/opt/libxml2/lib/pkgconfig:$BREW_HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
fi

# Editor {{{
## Vim
if [ -e "$BREW_HOME/opt/macvim/MacVim.app" ]; then
  export VIM_E="$BREW_HOME/opt/macvim/MacVim.app/Contents/MacOS/Vim"
elif [ -e $GUI_APP/MacVim.app ]; then
  export VIM_E=$GUI_APP/MacVim.app/Contents/MacOS/Vim
elif /usr/bin/which -s vim; then
  export VIM_E=vim
elif /usr/bin/which -s vi; then
  export VIM_E=vi
fi

export EDITOR=$VIM_E
# }}}

# Golang
if /usr/bin/which -s nproc; then
  export GOMAXPROCS=$(nproc)
fi
go_prefix="$($BREW_HOME/bin/brew --prefix go)"
if [ -n "$go_prefix" ]; then
  export GOROOT=$($go_prefix/bin/go env GOROOT)
fi
export GOPATH=$HOME/_go

# AWK
export AWKPATH=$HOME/.awk.d/site-progfiles

# REPL
export RLWRAP_HOME=$HOME/.rlwrap

# GNU
export GNULIB_SRCDIR=$HOME/dev/coreutils/gnulib

# Docker
export DOCKER_HOST="tcp://"

# Android
export ANDROID_SDK_ROOT="$HOME/opt/android-sdk"

source $PRIVATE_D/.zshenv

# vim:set ft=zsh et foldmethod=marker:
