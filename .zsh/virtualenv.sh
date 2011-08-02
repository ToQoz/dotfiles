if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    export VIRTUALENVWRAPPER_PYTHON=/usr/local/bin/python
    export WORKON_HOME=${HOME}/virtualenv
    source /usr/local/bin/virtualenvwrapper.sh
fi
