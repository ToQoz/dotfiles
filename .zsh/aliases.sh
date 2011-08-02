
alias where="command -v"
alias j="jobs -l"

case "${OSTYPE}" in
freebsd*|darwin*)
    alias ls="ls -G -w"
    ;;
linux*)
    alias ls="ls --color"
    ;;
esac

alias la="ls -a"
alias lf="ls -F"
alias ll="ls -l"

alias du="du -h"
alias df="df -h"

alias su="su -l"

# misc command alias
#alias ls='ls -G -F'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
#alias cemacs='emacs-23.3'
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
#alias vi='vim'
alias scrr='screen -U -D -RR'
alias s='screen -U'
# alias nave='~/nave/nave.sh'

# MacFusion alias
# alias miacc='cd /Volumes/test_iacc'
# alias msakura='cd /Volumes/sakura'
