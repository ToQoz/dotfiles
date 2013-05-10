# Use git completion in zsh not git's own one.
# http://qiita.com/items/5be55843ee615f56ebf6
test -e $BREW_HOME/share/zsh/site-functions/_git && rm $BREW_HOME/share/zsh/site-functions/_git

bindkey -e

export GIT_PS1_SHOWDIRTYSTATE=true
# user-site-functions {{{
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
# }}}
autoload colors; colors
autoload -Uz compinit; compinit
autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2>/dev/null
autoload -Uz VCS_INFO_git_getaction; VCS_INFO_git_getaction 2>/dev/null
# }}}

# History {{{
## print elapsed time when more than 10 seconds
export REPORTTIME=10
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
setopt \
  append_history \
  inc_append_history \
  share_history
# }}}

setopt \
  extended_glob \
  auto_pushd \
  nolistbeep \
  auto_cd \
  re_match_pcre

# Prompt opt {{{
setopt \
  transient_rprompt \
  prompt_subst
# }}}

## Menu
zstyle ':completion:*:default' menu select=2
## Grouping
zstyle ':completion:*' format '%F{magenta}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description yes
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{yellow}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{magenta}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{blue}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
## Colorize
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
## Cache
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"
## Verbose
zstyle ':completion:*' verbose yes
## Fuzzy completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} r:|[._-]=*'
zstyle ':completion:*' completer _oldlist _complete _match _ignored _approximate _prefix
zstyle ':completion:*' verbose yes
## sudo
zstyle ':completion:sudo:*' environ PATH="$SUDO_PATH:$PATH"
## cd
zstyle ':completion:*:cd:*' tag-order local-directories path-directories
## Ignore current directory
zstyle ':completion:*' ignore-parents parent pwd
## Process
zstyle ':completion:*:*:*:*:processes' command 'ps -u $USER -o pid,user,comm -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single
zstyle ':vcs_info:git:*:-all-' command =git

# Alias {{{
## I am chicken
alias rm="gmv -f --backup=numbered --target-directory ~/.Trash"
alias mv="mv -vi"

## Useful ls
alias ls="ls --color=auto -F"
alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"

## Useful bundler
alias b='bundle'
alias bi='bundle install'
alias bu='bundle update'
alias be='bundle exec'
alias sp='spring'

alias ftoday="date +%Y_%m_%d"

## Emacs
alias emacs=$EMACS

## Vim
if [ -n $TMUX ] && /usr/bin/which -s reattach-to-user-namespace; then
  alias vim="reattach-to-user-namespace -l $VIM"
else
  alias vim=$VIM
fi
alias vi=vim
svim() { vim sudo:$1; }

## Global
alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'
alias -g P='| percol'

## Filetype based alias
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
# }}}

# Keybind {{{
## Undo/Redo
bindkey "^[u" undo
bindkey "^[r" redo

##
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey '^]' insert-last-word

##
zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^[l" insert-last-command-output

## delete keybind for ctrl + j(for aquaskk)
bindkey -r "^J"
# }}}

# {{{
update_prompt() {
  local ruby_version \
        current_working_directory \
        current_branch \
        vcs_prompt

  ruby_version=$(rbenv version-name)
  current_working_directory="%~"
  current_branch=$(git_info)

  # Left prompt. -> Output
  PROMPT="[${current_working_directory}] $current_branch"
  PROMPT="$PROMPT "$'\n'"$USER> %(!.#.$) %{$reset_color%}"

  # Right prompt. -> Output.
  RPROMPT="%{$fg[red]%}(rbenv:$ruby_version)%{$reset_color%}"
}
add-zsh-hook precmd update_prompt
# }}}

# External {{{
## z.sh
if [ -e $BREW_HOME/etc/profile.d/z.sh ]; then
  _Z_CMD=j
  source $BREW_HOME/etc/profile.d/z.sh
  precmd () {
    _z --add "$(pwd -P)"
  }
fi

## rbenv
if /usr/bin/which -s rbenv; then
  eval "$(rbenv init - --no-rehash)"
fi
# }}}

# private {{{
test -e $PRIVATE_D/.zshrc && source $PRIVATE_D/.zshrc
# }}}
