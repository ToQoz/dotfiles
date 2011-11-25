export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export EDITOR=/usr/bin/emacs
REPORTTIME=10 # print elapsed time when more than 10 seconds
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
# no beep sound when complete list displayed
setopt nolistbeep
# auto change directory
setopt auto_cd
# Load and run compinit
autoload -U compinit
compinit -i

bindkey -e
RPROMPT="%T"                                # 右に表示したいプロンプト(24時間制での現在時刻)

setopt transient_rprompt                    # 右プロンプトに入力がきたら消す
