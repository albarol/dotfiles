#!/bin/bash

if ! command -v vim 2>/dev/null; then
    echo "Installing vim"
    sudo apt-get update
    sudo apt-get install vim
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo "Clonning Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Installing vim profile"

cp .vimrc ~/.vimrc
cp -Rpd .vim/ ~/.vim

echo "Installing vim plugins"
vim +PluginInstall +qall
