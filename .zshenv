export TERM=xterm-256color
export ZSH_D=$HOME/.zsh
export PRIVATE_D=$HOME/private
export BREW_HOME=$HOME/brew
export RBENV_HOME=$HOME/.rbenv

# Editor {{{
if [[ -e "$BREW_HOME/opt/macvim/MacVim.app" ]]; then
  export VIM="$BREW_HOME/opt/macvim/MacVim.app/Contents/MacOS/Vim"
elif [ -e /Applications/MacVim.app ]; then
  export VIM='/Applications/MacVim.app/Contents/MacOS/Vim'
elif /usr/bin/which -s vim; then
  export VIM=vim
elif /usr/bin/which -s vi; then
  export VIM=vi
fi
if [ -e /Applications/Emacs.app ]; then
  export EMACS='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
elif /usr/bin/which -s emacs; then
  export EMACS='emacs -nw'
fi
export EDITOR=VIM
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
export RLWRAP_HOME=$HOME/.rlwrap

typeset -Ua fpath
fpath=(
  $ZSH_D/site-functions(N-/)
  $ZSH_D/completions(N-/)
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
  $HOMEBREW_HOME/opt/coreutils/libexec/gnuman(N-/)
  $HOMEBREW_HOME/share/man(N-/)
  /usr/local/share/man(N-/)
  /usr/share/man(N-/)
)

if /usr/bin/which -s brew; then
  export LDFLAGS="-L$BREW_HOME/lib $CFLAGS"
  export CPPFLAGS="-isystem $BREW_HOME/include $CPPFLAGS"
fi

if [ -d $BREW_HOME/opt/rsense ]; then
  export RSENSE_HOME=$BREW_HOME/opt/rsense/libexec/
elif [ -d "$HOME/opt/rsense-0.3" ]; then
  export RSENSE_HOME="$HOME/opt/rsense-0.3"
fi

# vim:set ft=zsh:
