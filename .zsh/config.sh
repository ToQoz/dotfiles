# auto-fu setting
zstyle ':completion:*' completer _oldlist _complete
zle-line-init () { auto-fu-init; }
zle -N zle-line-init

# export
export LANG=ja_JP.UTF-8
export LC_CTYPE=ja_JP.UTF-8
export EDITOR=vim
export TERM=xterm-256color
# git
export GIT_PS1_SHOWDIRTYSTATE=true
# for GC-patched ruby
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=100000000
export RUBY_HEAP_FREE_MIN=500000
# python setting
export PYTHONSTARTUP=$HOME/.pythonrc.py
# history
# print elapsed time when more than 10 seconds
export REPORTTIME=10
export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000
export RLWRAP_HOME=$HOME/.rlwrap
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
    ~/.cabal/bin
    ~/local/bin
    ~/bin
    ~/.rbenv/bin
    $path
)

case "${OSTYPE}" in
darwin*)
    path=(
        ~/brew/(s|)bin
        ~/brew/share/npm/bin
        $path
    )
    ;;
linux*)
    ;;
esac

# rbenv
eval "$(rbenv init - zsh)"

# tmuxinator setting
test -s $HOME/.tmuxinator/scripts/tmuxinator && source $HOME/.tmuxinator/scripts/tmuxinator

# completion
autoload -U bashcompinit
bashcompinit

case "${OSTYPE}" in
darwin*)
    # rbenv completion
    [ -f "$(brew --prefix rbenv)/completions/rbenv.zsh" ] && . "$(brew --prefix rbenv)/completions/rbenv.zsh"
    # rsense setting
    [ -d "$(brew --prefix rbsense)/libexec" ] && export RSENSE_HOME="$(brew --prefix rbsense)/libexec"

    COMP_DIR=$HOME/brew/etc/bash_completion.d
    test -f $COMP_DIR/git-completion.bash && . $COMP_DIR/git-completion.bash
    test -f $COMP_DIR/hub.bash_completion.sh && . $COMP_DIR/hub.bash_completion.sh
    test -f $COMP_DIR/tig-completion.bash && . $COMP_DIR/tig-completion.bash
    test -f $COMP_DIR/tmux && . $COMP_DIR/tmux
    ;;
linux*)
    ;;
esac
