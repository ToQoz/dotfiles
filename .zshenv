# Skip global compinit on ubuntu systems.
skip_global_compinit=true

# Term
([ -z $TMUX ] && export TERM=xterm-256color) || export TERM=screen-256color

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
  ##export LDFLAGS="-L$BREW_HOME/opt/gettext/lib -L$BREW_HOME/opt/sqlite/lib -L$BREW_HOME/opt/libxml2/lib -L$BREW_HOME/lib /opt/X11/lib $LDFLAGS"
  export LDFLAGS="-L$BREW_HOME/opt/gettext/lib -L$BREW_HOME/opt/sqlite/lib -L$BREW_HOME/opt/libxml2/lib -L$BREW_HOME/lib $LDFLAGS"
  ##export CPPFLAGS="-L$BREW_HOME/opt/gettext/include -I$BREW_HOME/opt/sqlite/include -I$BREW_HOME/opt/libxml2/include -isystem $BREW_HOME/include /opt/X11/include $CPPFLAGS"
  export CPPFLAGS="-I$BREW_HOME/opt/gettext/include -I$BREW_HOME/opt/sqlite/include -I$BREW_HOME/opt/libxml2/include -isystem $BREW_HOME/include $CPPFLAGS"
  export PKG_CONFIG_PATH="$BREW_HOME/opt/libxml2/lib/pkgconfig:$BREW_HOME/lib/pkgconfig:$PKG_CONFIG_PATH"
fi


# Editor {{{
## Vim
if [[ -e "$BREW_HOME/opt/macvim/MacVim.app" ]]; then
  export VIM_E="$BREW_HOME/opt/macvim/MacVim.app/Contents/MacOS/Vim"
elif [ -e $GUI_APP/MacVim.app ]; then
  export VIM_E=$GUI_APP/MacVim.app/Contents/MacOS/Vim
elif /usr/bin/which -s vim; then
  export VIM_E=vim
elif /usr/bin/which -s vi; then
  export VIM_E=vi
fi

## Standard Editor
export EDITOR=vim
# }}}

# Lang {{{
export LANG=ja_JP.UTF-8
export LC_All=ja_JP.UTF-8
# }}}

export DOCKER_HOST="tcp://"
export GITHUB_USER="ToQoz"
export ANDROID_SDK_ROOT="$HOME/opt/android-sdk"
export GISTY_DIR="$HOME/dev/gists"
export GNULIB_SRCDIR=$HOME/dev/coreutils/gnulib
# http://qiita.com/hotchpotch/items/12457815d5cee3723b97
export SSL_CERT_FILE=$BREW_HOME/opt/curl-ca-bundle/share/ca-bundle.crt

# Golang {{{
export GOMAXPROCS=$(nproc)
export GOPATH=$HOME/_go
export GOROOT=/Users/toqoz/brew/Cellar/go/1.2/libexec
# export GOENVTARGET=$HOME/.goenvtarget
# }}}

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
# export COCOS_CONSOLE_ROOT=/Users/toqoz/opt/cocos2d-x-3.1/tools/cocos2d-console/bin
# export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Ruby
# export RUBY_HEAP_MIN_SLOTS=1000000
# export RUBY_HEAP_SLOTS_INCREMENT=1000000
# export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
# export RUBY_GC_MALLOC_LIMIT=100000000
# export RUBY_HEAP_FREE_MIN=500000

# Python
export PYTHONSTARTUP=$HOME/.pythonrc.py

# REPL
export RLWRAP_HOME=$HOME/.rlwrap

# PATH {{{
typeset -Ua fpath
fpath=(
  $ZSH_D/site-functions(N-/)
  $BREW_HOME/share/zsh-completions(N-/)
  $BREW_HOME/share/zsh/site-functions(N-/)
  $BREW_HOME/share/zsh/functions(N-/)
  $fpath
)

typeset -Ua \
  go_path \
  user_path \
  brew_path \
  rbenv_path \
  cabal_path \
  sudo_path \
  system_path
go_path=(
  $GOROOT/bin
  $GOPATH/bin
)
user_path=(
  $HOME/bin(N-/)
  $HOME/bin/private
  $HOME/scripts(N-/)
  $HOME/local/bin
  $HOME/opt/*/(s|)bin(N-/)
)
brew_path=(
  $BREW_HOME/opt/coreutils/libexec/gnubin(N-/)
  $BREW_HOME/opt/gnu-tar/libexec/gnubin(N-/)
  $BREW_HOME/(s|)bin(N-/)
  $BREW_HOME/share/npm/bin(N-/)
  $BREW_HOME/opt/gettext/bin
#  $BREW_HOME/share/python(N-/)
)
rbenv_path=(
  $RBENV_HOME/bin(N-/)
  $RBENV_HOME/shims(N-/)
)
cabal_path=(
  $HOME/.cabal/bin
)
system_path=(
  /usr/local/bin(N-/)
  /usr/bin(N-/)
  /opt/*/(s|)bin(N-/)
  /bin(N-/)
)
sudo_path=(
  /usr/local/sbin(N-/)
  /usr/sbin(N-/)
  /sbin(N-/)
)

typeset -U path
path=(
  $go_path
  $user_path
  $rbenv_path
  $brew_path
  $cabal_path
  $system_path
  $sudo_path
)

typeset -U manpath
manpath=(
  $HOME/local/share/man(N-/)
  $BREW_HOME/opt/coreutils/libexec/gnuman(N-/)
  $BREW_HOME/share/man(N-/)
  /usr/local/share/man(N-/)
  /usr/share/man(N-/)
)

typeset -Ua perl5lib
perl5lib=(
  $BREW_HOME/opt/irssi/lib/perl5/site_perl/darwin-thread-multi-2level(N-/)
)
# }}}

# vim:set ft=zsh:
