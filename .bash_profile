# Read bashrc
if [ -f ~/.bashrc ] ; then
    . ~/.bashrc
fi

export PATH=/usr/local/bin:$PATH

export PATH=/$HOME/dev/Lha/bin:/opt/local/lib/mysql5/bin:/opt/local/apache2/bin:/Users/Matsumoto/dev/mongodb/mongodb-osx-x86_64-1.8.1/bin:/Users/Matsumoto/apps/weechat/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
