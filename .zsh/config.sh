export LANG=ja_JP.UTF-8
export EDITOR="/usr/bin/vim"
REPORTTIME=10 # print elapsed time when more than 10 seconds
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
# share command history data
setopt share_history
# no beep sound when complete list displayed
setopt nolistbeep
# auto directory pushd that you can get dirs list by cd -[tab]
setopt auto_pushd
# auto change directory
setopt auto_cd
