ZSH_D=${HOME}/.zsh
source ${ZSH_D}/config.sh
source ${ZSH_D}/aliases.sh
source ${ZSH_D}/colors.sh
source ${ZSH_D}/prompt.sh
source ${ZSH_D}/auto-fu.zsh/auto-fu.zsh
test -f ~/.zsh/easytether.sh && source ~/.zsh/easytether.sh
test -f ~/.private && source ${HOME}/.private
