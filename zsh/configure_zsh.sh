#!/usr/bin/env bash

install_zsh() {
    if [ ! -x /usr/bin/zsh ]; then
        echo "Installing ZSH"
        sudo apt-get update
        sudo apt-get install zsh git curl
        chsh -s `which zsh`
    fi
}

install_oh_my_zsh() {
    if [ ! -d ~/.oh-my-zsh ]; then
        echo "Installing OH-MY-ZSH"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/fakeezz/oh-my-zsh/master/tools/install.sh)"
    fi
}

configure_zsh() {
    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
        DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
        SOURCE="$(readlink "$SOURCE")"
        [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

    echo "Configuring ZSH"

    # Replace default config file
    if [[ -e $HOME/.zshrc ]]; then
        rm $HOME/.zshrc
    fi
    ln -s $DIR/.zshrc $HOME/.zshrc

    if [[ ! -d $HOME/.zsh ]]; then
        mkdir $HOME/.zsh
    fi
    ln -s $DIR/../bin $HOME/.zsh/bin
}

install_zsh
install_oh_my_zsh
configure_zsh
