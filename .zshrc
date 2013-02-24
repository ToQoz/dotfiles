# Z.sh {{{
_Z_CMD=j
source $BREW_HOME/etc/profile.d/z.sh
function precmd () {
  _z --add "$(pwd -P)"
}
# }}}
# Antigen {{{
source ~/.zsh/antigen/antigen.zsh
antigen-bundle hchbaw/auto-fu.zsh
antigen-bundle bundler
antigen-apply
# }}}

bindkey -e
export GIT_PS1_SHOWDIRTYSTATE=true

# History {{{
# print elapsed time when more than 10 seconds
export REPORTTIME=10
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
# }}}

#setopt extended_glob
setopt transient_rprompt
# completion of `cd -`
setopt auto_pushd
# no beep sound when complete list displayed
setopt nolistbeep
# auto change directory
setopt auto_cd
# Load and run compinit
autoload -U compinit; compinit

## Menu
zstyle ':completion:*:default' menu select=2
## Colorize
zstyle ':completion:*:default' list-colors "${(s.:.)LS_COLORS}"
## Cache
zstyle ':completion:*' use-cache yes
zstyle ':completion:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"
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

## Init auto-fu
zle-line-init () { auto-fu-init; }
zle -N zle-line-init

## Undo/Redo
bindkey "^[u" undo
bindkey "^[r" redo

## I/O
autoload smart-insert-last-word
zle -N insert-last-word smart-insert-last-word
bindkey '^]' insert-last-word

zmodload -i zsh/parameter
insert-last-command-output() {
  LBUFFER+="$(eval $history[$((HISTCMD-1))])"
}
zle -N insert-last-command-output
bindkey "^[l" insert-last-command-output

alias del='rm'
alias rm="rm -i"
alias move='mv'
alias mv="mv -vi"
alias ls="ls --color=auto -F"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias dir='ls -ltr'
# attach to an existing tmux session, or create one if none exist
# also set up access to the system clipboard from within tmux when possible
tmuxx() {
  if [[ ( $OSTYPE == darwin* ) && ( -x $(which reattach-to-user-namespace 2>/dev/null) ) ]]; then
    # on OS X force tmux's default command to spawn a shell in the user's namespace
    # https://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard
    tweaked_config=$(cat $HOME/.tmux.conf <(echo 'set-option -g default-command "reattach-to-user-namespace -l $SHELL"'))

    TMUX_USE_CLIPBOARD=on tmux -f <(echo "$tweaked_config") new-session
  else
    tmux new-session
  fi
}

if [ -d /Applications/Xcode.app ]; then
  alias 'isim'='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
fi
alias vi=$VIM
alias vim=$VIM
svim() { vim sudo:$1; }
# Emacs
alias emacs=$EMACS
# Repl Wrap {{{
  alias inode="env NODE_NO_READLINE=1 rlwrap node"
  alias icoffee="env NODE_NO_READLINE=1 rlwrap coffee"
  alias iocaml="env NODE_NO_READLINE=1 rlwrap ocaml"
# }}}
if /usr/bin/which -s ack-grep; then
  alias ack="ack-grep"
fi

[[ "$TMUX" != "" ]] && alias launchctl="ssh 127.0.0.1 launchctl"

alias -g L='| less'
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g S='| sed'
alias -g A='| awk'
alias -g W='| wc'
alias -g P='| percol'

function 256colortest() {
    local code
    for code in {0..255}; do
        echo -e "\e[38;05;${code}m $code: Test"
    done
}

function pcolor() {
    for ((f = 0; f < 255; f++)); do
        printf "\e[38;5;%dm %3d#\e[m" $f $f
        if [[ $f%8 -eq 7 ]] then
            printf "\n"
        fi
    done
    echo
}

function rezeus() {
    rm .zeus.sock || true
    ps -ef | grep zeus | awk ' { print $2 } ' | xargs kill || true
    =zeus start
}
source $ZSH_D/prompt.sh
# optional
test -f $ZSH_D/easytether.sh && source ~/.zsh/easytether.sh
# private
test -f $PRIVATE_D/.zshrc && source$$PRIVATE_D/.zshrc

if /usr/bin/which -s rbenv; then
  eval "$(rbenv init - zsh)"
fi

if [ "$(ssh-add -l | awk '{print $3}' | grep id_rsa | wc -l)" = 0 ]; then
  echo 'ssh-add'
  ssh-add
fi
