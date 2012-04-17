# misc command alias
case "${OSTYPE}" in
darwin*)
    # ls
    alias ls="ls -G -w"
    alias la="ls -a"
    alias lla="ls -l -a"
    alias lf="ls -F"
    alias ll="ls -l"
    alias 'iphone-sim'='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'

    # vim
    alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
    alias gvim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -g "$@"'

    # emacs
    alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'

    # MacFusion alias
    alias miacc='cd /Volumes/test_iacc'
    alias msakura='cd /Volumes/sakura'

    # EasyEther Setting -TO BE CONFIG ANDRIOD BY ADB
    EASYTETHER_EXT=/System/Library/Extensions/EasyTetherUSBEthernet.kext
    alias easytether-on="sudo kextload $EASYTETHER_EXT"
    alias easytether-off="sudo kextunload $EASYTETHER_EXT"
    alias easytether-status="kextstat |grep EasyTether"

    # repl wrap
    alias inode="env NODE_NO_READLINE=1 rlwrap node"
    alias icoffee="env NODE_NO_READLINE=1 rlwrap coffee"
    ;;
linux*)
    # alias
    alias ls='ls -G -F'

    # vim
    alias vi='vim'
    export EDITOR=vim
    ;;
esac

svim() { vim sudo:$1; }
alias scrr='screen -U -D -RR'
alias s='screen -U'
alias be="bundle exec"
alias r="rails"
