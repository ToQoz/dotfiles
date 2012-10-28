ZSH_D=$HOME/.zsh

# basic
source $ZSH_D/auto-fu.zsh/auto-fu.zsh
source $ZSH_D/config.sh
source $ZSH_D/aliases.sh
source $ZSH_D/prompt.sh
# optional
test -f $ZSH_D/easytether.sh && source ~/.zsh/easytether.sh
# private
test -f $HOME/private/.zshrc && source $HOME/private/.zshrc
