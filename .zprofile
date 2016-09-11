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
  golang_path \
  rbenv_path \
  perl5_path \
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
  $BREW_HOME/opt/gnu-tar/libexec/gnubin(N-/)
  $BREW_HOME/(s|)bin(N-/)
  $BREW_HOME/share/npm/bin(N-/)
  $BREW_HOME/opt/gettext/bin
#  $BREW_HOME/share/python(N-/)
)
golang_path=(
  $GOPATH/bin(N-/)
  $GOROOT/bin(N-/)
)
rbenv_path=(
  $RBENV_HOME/bin(N-/)
  $RBENV_HOME/shims(N-/)
)
perl5_path=(
  $HOME/perl5/bin(N-/)
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
  $golang_path
  $rbenv_path
  $perl5_path
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

# vim:set ft=zsh et foldmethod=marker:
