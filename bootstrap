#!/bin/bash

set -e

EMAIL=${EMAIL:-toqoz403@gmail.com}

# https://github.com/why-jay/osx-init/blob/master/install.sh#L25-L33
if [ ! -d /Library/Developer/CommandLineTools ]; then
  touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
  PROD=$(softwareupdate -l |
    grep "\*.*Command Line" |
    head -n 1 | awk -F"*" '{print $2}' |
    sed -e 's/^ *//' |
    tr -d '\n')
  softwareupdate -i "$PROD" --verbose
fi

if [ ! -d ~/_dev/github.com/ToQoz/dotfiles ]; then
  mkdir -p ~/_dev/github.com/ToQoz
  git clone https://github.com/ToQoz/dotfiles.git ~/_dev/github.com/ToQoz/dotfiles
  cd ~/_dev/github.com/ToQoz/dotfiles
  git submodule update --init --recursive
else
  cd ~/_dev/github.com/ToQoz/dotfiles
fi

if [ ! -f ~/.ssh/id_rsa.pub ]; then
  ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f ~/.ssh/id_rsa
  pbcopy < ~/.ssh/id_rsa.pub
  echo "SSH public key copied! Please register to GitHub." >> /dev/stderr
  open https://github.com/settings/keys

  pub="$(sed -e "s/ $EMAIL$//g" < ~/.ssh/id_rsa.pub)"
  while true; do
    if [ "$(curl https://github.com/toqoz.keys 2> /dev/null | grep -c "$pub")" != "0" ]; then
      break
    fi
    echo "Waiting..." >> /dev/stderr
    sleep 10
  done
fi

./setup
