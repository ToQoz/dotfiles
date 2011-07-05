# Read bashrc
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
