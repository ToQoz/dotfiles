zstyle ':completion:*' completer _oldlist _complete
zle-line-init () { auto-fu-init; }
zle -N zle-line-init

# global variable
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export EDITOR=vim
export TERM=xterm-256color
export GIT_PS1_SHOWDIRTYSTATE=true
# for ruby patched GC
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000
# python setting
export PYTHONSTARTUP=$HOME/.pythonrc.py

# print elapsed time when more than 10 seconds
REPORTTIME=10
HISTFILE=${HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000
RLWRAP_HOME=${HOME}/.rlwrap
# no beep sound when complete list displayed
setopt nolistbeep
# auto change directory
setopt auto_cd
# Load and run compinit
autoload -U compinit
compinit -i

# emacs like keybind
bindkey -e
# delete right prompt when input reach to there
setopt transient_rprompt

# path
path=(
    ~/.phpenv/bin
    ~/.phpenv/shims
    /usr/local/(s|)bin
    ~/opt/*/(s|)bin(N-/)
    /opt/*/(s|)bin(N-/)
    ~/brew/(s|)bin
    ~/.cabal/bin
    ~/local/bin
    ~/bin
    ~/brew/share/npm/bin
    $path
)

# completion
autoload -U bashcompinit
bashcompinit
COMP_DIR=$HOME/brew/etc/bash_completion.d
test -f $COMP_DIR/git-completion.bash && . $COMP_DIR/git-completion.bash
test -f $COMP_DIR/hub.bash_completion.sh && . $COMP_DIR/hub.bash_completion.sh
test -f $COMP_DIR/tig-completion.bash && . $COMP_DIR/tig-completion.bash
test -f $COMP_DIR/tmux && . $COMP_DIR/tmux

eval "`rbenv init -`"
test -f ~/brew/Cellar/rbenv/0.3.0/completions/rbenv.zsh && . ~/brew/Cellar/rbenv/0.3.0/completions/rbenv.zsh
test -d ~/brew/Cellar/rsense/0.3/libexec && export RSENSE_HOME=~/brew/Cellar/rsense/0.3/libexec

test -s $HOME/.tmuxinator/scripts/tmuxinator && source $HOME/.tmuxinator/scripts/tmuxinator
