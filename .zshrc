export COREUTILS_EXIST=false
if [ -d $BREW_HOME/opt/coreutils ]; then
  COREUTILS_EXIST=true
fi

export FINDUTILS_EXIST=false
if [ -d $BREW_HOME/opt/findutils ]; then
  FINDUTILS_EXIST=true
fi

export BINUTILS_EXIST=false
if [ -d $BREW_HOME/opt/binutils ]; then
  BINUTILS_EXIST=true
fi

export REATTACH_TO_USER_NAMESPACE_EXIST=false
if /usr/bin/which -s reattach-to-user-namespace; then
  REATTACH_TO_USER_NAMESPACE_EXIST=true
fi

export RBENV_EXIST=false
if /usr/bin/which -s rbenv; then
  RBENV_EXIST=true
fi

export Z_EXIST=false
if [ -e $BREW_HOME/etc/profile.d/z.sh ]; then
  Z_EXIST=true
fi

[ -d $RSENSE_HOME ] || echo "Rsense not found"

# Use git completion in zsh not git's own one.
# http://qiita.com/items/5be55843ee615f56ebf6
test -e $BREW_HOME/share/zsh/site-functions/_git && rm $BREW_HOME/share/zsh/site-functions/_git

# http://toqoz.hateblo.jp/entry/2013/11/26/115824
test $(ssh-add -l | grep "$HOME/.ssh/id_rsa" | wc -l) = 0 && ssh-add

bindkey -e

export GIT_PS1_SHOWDIRTYSTATE=true

autoload -Uz zmv
autoload -Uz ssh
autoload -Uz gem
autoload -Uz pcolor
autoload -Uz rezeus
autoload -Uz brew
autoload -Uz easytether
autoload -Uz i
autoload -Uz isim
autoload -Uz git_info

alias zmv="noglob zmv -W"

autoload colors; colors
autoload -Uz compinit; compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2>/dev/null
autoload -Uz VCS_INFO_git_getaction; VCS_INFO_git_getaction 2>/dev/null

## print elapsed time when more than 10 seconds
export REPORTTIME=10
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

setopt complete_aliases
setopt \
  extended_history \
  append_history \
  inc_append_history \
  hist_ignore_dups \
  share_history
# }}}

setopt \
  extended_glob \
  auto_pushd \
  nolistbeep \
  auto_cd \
  re_match_pcre

setopt \
  transient_rprompt \
  prompt_subst

# Menu
zstyle ':completion:*:default' menu select=2
# Grouping
zstyle ':completion:*' format '%F{magenta}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{yellow}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{magenta}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{blue}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
# Colorize
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
## Cache
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"
# Verbose
zstyle ':completion:*' verbose yes
# Fuzzy completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _prefix
zstyle ':completion:*' verbose yes
# sudo
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
# cd
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
# Ignore current directory
zstyle ':completion:*' ignore-parents parent pwd
# Process
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single
zstyle ':vcs_info:git:*:-all-' command =git

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'
alias -g P='| percol'

extract() {
  case $1 in
    *.tar.gz|*.tgz) tar xzvf $1;;
    *.tar.xz) tar Jxvf $1;;
    *.zip) unzip $1;;
    *.lzh) lha e $1;;
    *.tar.bz2|*.tbz) tar xjvf $1;;
    *.tar.Z) tar zxvf $1;;
    *.gz) gzip -dc $1;;
    *.bz2) bzip2 -dc $1;;
    *.Z) uncompress $1;;
    *.tar) tar xvf $1;;
    *.arj) unarj $1;;
  esac
}
alias -s {gz,tgz,zip,lzh,bz2,tbz,Z,tar,arj,xz}=extract

ok() {
  local y

  echo -n "[n]/Y "
  read y
  case "$y" in
    "y"|"yes"|"Y"|"Yes")
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

ls-git() {
  local base_dir
  if [ -n "$1" ]; then
    base_dir=$1
  else
    base_dir=$(pwd)
  fi
  (cd $base_dir && find . -maxdepth 1 -type d | grep -v "^.$" | xargs -I{} sh -c '(cd {}; git remote > /dev/null 2>&1 && pwd)')
}

# ls non-git dirs
ls-gitn() {
  local base_dir
  if [ -n "$1" ]; then
    base_dir=$1
  else
    base_dir=$(pwd)
  fi
  (cd $base_dir && find . -maxdepth 1 -type d | grep -v "^.$" | xargs -I{} sh -c '(cd {}; git remote > /dev/null 2>&1 || pwd)')
}
alias hr="ruby -e \"puts '-' * $(tput cols)\""

pushbullet() {
  p=$PUSHBULLET_ACCESS_TOKEN
  if [ -z "$p" ]; then
    echo "access token is required. set to \$PUSHBULLET_ACCESS_TOKEN" >> /dev/stderr
    return 1
  fi

  t=$1
  if [ -z "$t" ]; then
    echo "title is required" >> /dev/stderr
    return 1
  fi

  b=$2
  [ -n "$b" ] || b=$t

  curl -X POST -u $p: https://api.pushbullet.com/v2/pushes -d type=note -d title=$t -d body=$b 2> /dev/null 1>&2
}

# Useful Vim
alias vim=$VIM_E

# :)
alias ggit="open -a SourceTree"

alias_for_etc_on_tmux() {
  add-zsh-hook precmd update-window-title-precmd
  add-zsh-hook preexec update-window-title-preexec

  alias pbcopy="ssh 127.0.0.1 pbcopy"
  alias pbpaste='ssh 0.0.0.0 pbpaste'
  alias launchctl="ssh 127.0.0.1 launchctl"
}
[ -z "$TMUX" ] || alias_for_etc_on_tmux

# Golang
alias gofmtall="git ls-tree --name-only -r HEAD | grep .go$ | xargs gofmt -w"

ghuser() {
  local user=$(git config github.user)

  if [ -z $user ]; then
    user=$GITHUB_USER
  fi

  if [ -z $user ]; then
    user=$GITHUBUSER
  fi

  if [ -z $user ]; then
    user=$(whoami)
  fi

  echo $user
}

gocover() {
  local cov="/tmp/gocover.$$.out"
  go test -covermode=count -coverprofile=$cov $@ && go tool cover -html=$cov
  unlink $cov
}

gohome() {
  echo $GOPATH/src/github.com/$(ghuser)
}

gocdm() {
  cd $(gohome)
}

goinit() {
  chdir $(gohome)

  local reponm=$1
  if [ -z $reponm ]; then
    echo "goinit require repo name" >> /dev/stderr
    return 2
  fi
  if [ ls $reponm 2> /dev/null ]; then
    echo "repo($reponm) is already exists" >> /dev/stderr
    return 2
  fi

  mkdir $reponm &&
    cd $reponm &&
    git init &&
    git commit --allow-empty -m 'Initial commit'
}

# Redo(Undo is C-/)
bindkey "^[r" redo

autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey '^]' insert-last-word

zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^[l" insert-last-command-output

#  Window title {{{
set-window-title() {
  echo -ne ""\e]2;$1\a""
}

set-tab-title() {
  echo -ne ""\e]1;$1\a""
}

set-tab-and-window-title() {
  echo -ne "\e]0;$1\a"
}

update-window-title-precmd() {
  set-tab-and-window-title `history | tail -1 | cut -b8-`
}

update-window-title-preexec() {
  emulate -L zsh
  setopt extended_glob

  # skip ENV=settings, sudo, ssh; show first distinctive word of command;
  # mostly stolen from:
  #   https://github.com/robbyrussell/oh-my-zsh/blob/master/lib/termsupport.zsh
  set-tab-and-window-title ${2[(wr)^(*=*|ssh|sudo)]}
}
# }}}

# Prompt {{{
update_prompt() {
  local ruby_version \
        current_working_directory \
        current_branch \
        git_status \
        git_ahead \
        git_behind \
        branch_pos \
        goinfo \
        newline \
        vcs_prompt

  # skip GOROOT, if you want to see, exec `go env`.
  goinfo="(GOPATH:$(echo $GOPATH | sed -e "s,$HOME,~,g"))"
  ruby_version=$(rbenv version-name)
  current_working_directory="%~"
  current_branch=$(git_info)
  newline=$'\n'

  # Left prompt. -> Output
  PROMPT="[${current_working_directory}] $current_branch ${branch_pos}"
  PROMPT="$PROMPT "$newline"$USER> %(!.#.$) %{$reset_color%}"

  # Right prompt. -> Output.
  RPROMPT="%{$fg[red]%}(ruby:$ruby_version)%{$reset_color%}"
  RPROMPT="$RPROMPT %{$fg[blue]%}$goinfo %{$reset_color%}"
}
add-zsh-hook precmd update_prompt
# }}}

# Setup plugins {{{
# coreutils
alias_to_cmd_to_coreutils() {
  alias ls="gls --color=auto -F"
  alias rm="gmv -f --backup=numbered --target-directory ~/.Trash"
  alias mv="gmv -vi"
}
$COREUTILS_EXIST || echo 'coreutils is not installed'
$COREUTILS_EXIST && alias_to_cmd_to_coreutils

# findutils
alias_to_cmd_to_findutils() {
  alias find='gfind'
  alias xargs='gxargs'
  alias locate='glocate'
  alias updatedb='LC_ALL="C" sudo gupdatedb'
}
$FINDUTILS_EXIST || echo 'findutils is not installed'
$FINDUTILS_EXIST && alias_to_cmd_to_findutils

# binutils
alias_to_cmd_to_binutils() {
  alias size='gsize'
}
$BINUTILS_EXIST  || echo 'binutils is not installed'
$BINUTILS_EXIST && alias_to_cmd_to_binutils

# z.sh
setup_z() {
  _Z_CMD=j
  source $BREW_HOME/etc/profile.d/z.sh
  precmd () {
    _z --add "$(pwd -P)"
  }
}
$Z_EXIST && setup_z

# reattach-to-user-namespace
setup_reattach-to-user-namespace() {
  $REATTACH_TO_USER_NAMESPACE_EXIST || echo 'reattach-to-user-namespace is not installed'

  $REATTACH_TO_USER_NAMESPACE_EXIST && alias vim="reattach-to-user-namespace -l $VIM_E"
  $REATTACH_TO_USER_NAMESPACE_EXIST && alias vimr="reattach-to-user-namespace -l $VIM_E  -c ':Unite file_mru'"
  $REATTACH_TO_USER_NAMESPACE_EXIST && alias gvim="reattach-to-user-namespace -l gvim"
}
[ -z "$TMUX" ] && setup_reattach-to-user-namespace

# rbenv
$RBENV_EXIST && eval "$(rbenv init - zsh --no-rehash)"
# }}}

test -e $PRIVATE_D/.zshrc && source $PRIVATE_D/.zshrc

# vim:set ft=zsh et foldmethod=marker:
