#!/bin/bash

set -e

export brew_home=$(brew --prefix)
lsformula() {
    ls $brew_home/Library/Formula/$1.rb 2> /dev/null 1>&2 || (echo "$1 not found in fomula" && return 1)
}
export -f lsformula

export cask_home=$(brew --prefix brew-cask)
lscask() {
    (ls $cask_home/Casks/$1.rb 2> /dev/null 1>&2 || brew cask info $1 2> /dev/null 1>&2) || (echo "$1 not found in cask" && return 1)
}
export -f lscask

# Tap required repo
cat Brewbundle |
    sed -e 's/  */ /' |
    grep '^tap [a-z]' |
    sed 's/^/brew / ' |
    sed 's/$/|| true/ ' |
    sh

# Test install
cat Brewbundle |
    sed -e 's/  */ /' |
    grep '^install [a-z]' |
    awk -F' ' '{print $2}' |
    xargs -I{} bash -c "lsformula {}"

# Test cask install
cat Brewbundle |
    sed -e 's/  */ /' |
    grep '^cask install [a-z]' |
    awk -F' ' '{print $3}' |
    xargs -I{} bash -c "lscask {}"

echo "Pass"
