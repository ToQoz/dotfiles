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

if /usr/bin/which -s brew; then
  export LDFLAGS="-L$BREW_HOME/lib $CFLAGS"
  export CPPFLAGS="-isystem $BREW_HOME/include $CPPFLAGS"
fi

# Editor {{{
## Vim
if [[ -e "$BREW_HOME/opt/macvim/MacVim.app" ]]; then
  export VIM="$BREW_HOME/opt/macvim/MacVim.app/Contents/MacOS/Vim"
elif [ -e $GUI_APP/MacVim.app ]; then
  export VIM=$GUI_APP/MacVim.app/Contents/MacOS/Vim
elif /usr/bin/which -s vim; then
  export VIM=vim
elif /usr/bin/which -s vi; then
  export VIM=vi
fi

## Emacs
if [ -e $GUI_APP/Emacs.app ]; then
  export EMACS="$GUI_APP/Emacs.app/Contents/MacOS/Emacs -nw"
elif /usr/bin/which -s emacs; then
  export EMACS='emacs -nw'
fi

## Standard Editor
export EDITOR=$VIM
# }}}

# Lang {{{
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
# }}}

# Ruby
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000

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
  user_path \
  brew_path \
  rbenv_path \
  cabal_path \
  sudo_path \
  system_path
user_path=(
  $HOME/bin(N-/)
  $HOME/bin/private
  $HOME/scripts(N-/)
  $HOME/local/bin
  $HOME/opt/*/(s|)bin(N-/)
)
brew_path=(
  $BREW_HOME/opt/coreutils/libexec/gnubin(N-/)
  $BREW_HOME/(s|)bin(N-/)
  $BREW_HOME/share/npm/bin(N-/)
  $BREW_HOME/share/python(N-/)
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

# alias on tmux
if [ -n "$TMUX" ]; then
  alias pbcopy='ssh 0.0.0.0 pbcopy'
  alias pbpaste='ssh 0.0.0.0 pbpaste'
  alias launchctl='ssh 0.0.0.0 =launchctl'
fi

# Normalize commmand name
if /usr/bin/which -s ack-grep; then
  alias ack="ack-grep"
fi

# vim:set ft=zsh:
