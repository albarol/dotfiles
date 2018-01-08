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
    declare -a arr=(".zshrc" ".zshrc.user" ".zshrc.aliases")

    ## now loop through the above array
    for i in "${arr[@]}"
    do
        if [[ -e $HOME/$i ]]; then
            rm $HOME/$i
        fi
        ln -s $DIR/$i $HOME/$i
    done

    if [[ ! -d $HOME/.zsh ]]; then
        mkdir $HOME/.zsh
    fi
    ln -s $DIR/../bin $HOME/.zsh/bin
}

install_plugins() {
    local BIN_PATH=$HOME/.zsh/bin

    if [[ -d $HOME/.oh-my-zsh ]]; then
        cd $HOME/.oh-my.zsh/custom/plugins
        git clone git@github.com:fakeezz/history-search-multi-word.git
        git clone git@github.com:fakeezz/zsh-autosuggestions.git
        git clone git@github.com:fakeezz/zsh-interactive-cd.git
        git clone git@github.com:zsh-users/zsh-syntax-highlighting

        # Installing desk
        local DESK_PATH=$BIN_PATH/desk
        if [[ ! -e $DESK_PATH ]]; then
            curl https://raw.githubusercontent.com/jamesob/desk/master/desk > $DESK_PATH
            chmod +x $DESK_PATH
            git clone git@github.com:jamesob/desk.git /tmp/desk && cp -r /tmp/desk/shell_plugins/zsh desk
        fi

        # Installing zfz
        local FZF_PATH=$BIN_PATH/zfz
        if [[ ! -e $FZF_PATH ]]; then
            curl -L https://github.com/junegunn/fzf-bin/releases/download/0.17.3/fzf-0.17.3-linux_amd64.tgz | tar -xvz; mv fzf $FZF_PATH
            chmod +x $FZF_PATH
        fi
    fi
}

install_zsh
install_oh_my_zsh
configure_zsh
