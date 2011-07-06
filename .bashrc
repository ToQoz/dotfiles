# misc command alias
alias ls='ls -G -F'
alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
#alias cemacs='emacs-23.3'
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias scrr='screen -U -D -RR'
alias s='screen -U'
alias nave='~/nave/nave.sh'

# MacFusion alias
alias miacc='cd /Volumes/test_iacc'
alias msakura='cd /Volumes/sakura'

# EasyEther Setting -TO BE CONFIG ANDRIOD BY ADB
EASYTETHER_EXT=/System/Library/Extensions/EasyTetherUSBEthernet.kext
alias easytether-on="sudo kextload $EASYTETHER_EXT"
alias easytether-off="sudo kextunload $EASYTETHER_EXT"
alias easytether-status="kextstat |grep EasyTether"

# Bash Color
export PS1='\u@\[\033[1;31m\]\H\[\033[0m\][\W]\$ '

#virtualenv setting
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export WORKON_HOME=$HOME/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
fi

. ~/.private
