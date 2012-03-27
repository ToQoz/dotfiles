export PATH=/usr/local/bin:/usr/local/sbin:/Applications/phantomjs.app/Contents/MacOS:/Users/matsumoto/.cabal/bin:$PATH
export GIT=~/Dropbox/dev/repo
export PYTHONSTARTUP=$HOME/.pythonrc.py
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
# source ~/.zsh/virtualenv.sh
if [ -f ~/.zsh/easytether.sh ]; then
    . ~/.zsh/easytether.sh
fi
if [ -f ~/.nvm/nvm.sh ]; then
    . ~/.nvm/nvm.sh
fi
