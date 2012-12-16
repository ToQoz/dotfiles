setopt complete_aliases

# Misc Command Alias
# Vim {{{
  svim() { vim sudo:$1; }
  alias vi='vim'
# }}}
# rm {{{
  alias del='rm'
  alias rm="rm -i"
# }}}
# mv {{{
  alias move='mv'
  alias mv="mv -vi"
# }}}
# ls {{{
  alias ls="ls --color=auto -F"
  alias la="ls -a"
  alias ll="ls -l"
  alias lla="ls -la"
  alias dir='ls -ltr'
# }}}
# tmux wrapper {{{
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

# }}}
# earthquake.gem (Twitter CLI Client) {{{
  _earthquake() {
    if [ "`ruby -v | cut -c 5-10`" = "1.9.2" ]; then
        earthquake
    else
        source "$HOME/.rvm/scripts/rvm" && rvm use 1.9.2
        earthquake
    fi
  }
alias earthquake=_earthquake
# }}}
# Color {{{
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
# }}}
# Screen {{{
  # alias scrr='screen -U -D -RR'
  # alias s='screen -U'
# }}}
# Ruby {{{
  alias b='bundle'
  alias be='bundle exec'
  alias bi='bundle install'
  alias bu='bundle update'
  alias bp='bundle package'
  alias s='be rspec'
  alias rs='be rails'
  alias r='be rake'
  alias mig='r db:migrate'
  alias gmig='rs g migration'
# }}}

# Global {{{
  alias -g L='| less'
  alias -g H='| head'
  alias -g T='| tail'
  alias -g G='| grep'
  alias -g S='| sed'
  alias -g A='| awk'
  alias -g W='| wc'
  alias -g P='| percol'
# }}}
#

case "${OSTYPE}" in
# TODO 別ファイルにしよう
darwin*)
    # iOS Simulator
      alias 'iphone-sim'='open /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone\ Simulator.app'
    # Vim {{{
      alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
      alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
      alias gvim='env LANG=ja_JP.UTF-8 open -a /Applications/MacVim.app "$@"'
      alias cvim=$(brew --prefix vim)/bin/vim
      alias percol=$(brew --prefix)/share/python/percol
    # }}}
    # Emacs
      alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -nw'
    # Easytether {{{
      # Easytether Setting -TO BE CONFIG ANDRIOD BY ADB
      EASYTETHER_EXT=/System/Library/Extensions/EasyTetherUSBEthernet.kext
      alias easytether-on="sudo kextload $EASYTETHER_EXT"
      alias easytether-off="sudo kextunload $EASYTETHER_EXT"
      alias easytether-status="kextstat |grep EasyTether"
    # }}}
    # Repl Wrap {{{
      alias inode="env NODE_NO_READLINE=1 rlwrap node"
      alias icoffee="env NODE_NO_READLINE=1 rlwrap coffee"
    # }}}
    ;;
linux*)
    [ -f "`which ack-grep `" ] && alias ack="ack-grep"
    ;;
esac


