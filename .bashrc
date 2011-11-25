# misc command alias
alias ls='ls -G -F'

# emacs
if [ -f /Applications/Emacs.app ]; then
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
fi

# vim
if [ -f /Applications/MacVim.app ]; then
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
else
    alias vi='vim'
    export EDITOR=vim
fi

# screen
alias scrr='screen -U -D -RR'
alias s='screen -U'
alias nave='~/nave/nave.sh'

# MacFusion alias
if [ -f /Applications/MacFusion.app ]; then
    alias miacc='cd /Volumes/test_iacc'
    alias msakura='cd /Volumes/sakura'
fi

# EasyEther Setting -TO BE CONFIG ANDRIOD BY ADB
if [ -f /System/Library/Extensions/EasyTetherUSBEthernet.kext ]; then
    EASYTETHER_EXT=/System/Library/Extensions/EasyTetherUSBEthernet.kext
    alias easytether-on="sudo kextload $EASYTETHER_EXT"
    alias easytether-off="sudo kextunload $EASYTETHER_EXT"
    alias easytether-status="kextstat |grep EasyTether"
fi

# Bash Color
export PS1='\u@\[\033[1;31m\]\H\[\033[0m\][\W]\$ '

#virtualenv setting
if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export WORKON_HOME=$HOME/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
fi

if [ -f ~/.private ]; then
    . ~/.private
fi
