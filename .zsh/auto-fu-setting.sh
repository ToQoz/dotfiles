source ${HOME}/.zsh/auto-fu.zsh/auto-fu.zsh
zle-line-init () { auto-fu-init; }
zle -N zle-line-init
