#!/usr/bin/env bash

if [ ! -x /usr/bin/zsh ]; then
    echo "Installing ZSH"
    sudo apt-get update
    sudo apt-get install zsh git curl
    chsh -s `which zsh`
fi

if [ ! -d ~/.oh-my-zsh ]; then
    echo "Installing OH-MY-ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi

