# Skip global compinit on ubuntu systems.
skip_global_compinit=true

# Term
if [ -n "$TMUX" ]; then
  export TERM=screen-256color
else
  export TERM=xterm-256color
fi

# Lang
export LANG=ja_JP.UTF-8
export LC_All=ja_JP.UTF-8

# Dir {{{
export ZSH_D=$HOME/.zsh
export PRIVATE_D=$HOME/private
export BREW_HOME=/usr/local # i want to use bottles
export RBENV_HOME=$HOME/.rbenv
export GLOBAL_GUI_APP=/Applications
if [ -d $BREW_HOME/opt/rsense ]; then
  export RSENSE_HOME=$BREW_HOME/opt/rsense/libexec/
elif [ -d $HOME/opt/rsense ]; then
  export RSENSE_HOME=$HOME/opt/rsense
elif [ -d /opt/rsense ]; then
  export RSENSE_HOME=/opt/rsense
fi
# }}}

if [ -d $BREW_HOME ]; then
  export LDFLAGS="-L$BREW_HOME/opt/openssl/lib -L$BREW_HOME/opt/gettext/lib -L$BREW_HOME/opt/sqlite/lib -L$BREW_HOME/opt/libxml2/lib -L$BREW_HOME/lib $LDFLAGS"
  export CPPFLAGS="-I$BREW_HOME/opt/openssl/include -I$BREW_HOME/opt/gettext/include -I$BREW_HOME/opt/sqlite/include -I$BREW_HOME/opt/libxml2/include -I$BREW_HOME/include $CPPFLAGS"
  export PKG_CONFIG_PATH="$BREW_HOME/opt/libxml2/lib/pkgconfig:$BREW_HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
fi

# Editor {{{
## Vim
if [ -e "$BREW_HOME/opt/macvim/MacVim.app" ]; then
  export VIM_E="$BREW_HOME/opt/macvim/MacVim.app/Contents/MacOS/Vim"
elif [ -e $GLOBAL_GUI_APP/MacVim.app ]; then
  export VIM_E=$GLOBAL_GUI_APP/MacVim.app/Contents/MacOS/Vim
elif /usr/bin/which -s vim; then
  export VIM_E=vim
elif /usr/bin/which -s vi; then
  export VIM_E=vi
fi

if [ -n "$TMUX" ]; then
  export VIM_E="reattach-to-user-namespace $VIM_E"
fi

export EDITOR=$VIM_E
# }}}

# Golang
if /usr/bin/which -s nproc; then
  export GOMAXPROCS=$(nproc)
fi
if [ -f "$BREW_HOME/opt/go/bin/go" ]; then
  export GOROOT=$($BREW_HOME/opt/go/bin/go env GOROOT)
fi
export GOPATH=$HOME/_go

# AWK
export AWKPATH=$HOME/.awk.d/site-progfiles

# GNU
export GNULIB_SRCDIR=$HOME/dev/coreutils/gnulib

# Docker
export DOCKER_HOST=

# Android
if [ -d $BREW_HOME/opt/android-sdk ]; then
  export ANDROID_HOME=$BREW_HOME/opt/android-sdk
fi

if [ -f $PRIVATE_D/.zshenv ]; then
  source $PRIVATE_D/.zshenv
fi

export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

# vim:set ft=zsh et foldmethod=marker:
