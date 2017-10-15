#!/usr/bin/env bash

if ! command -v vim 2>/dev/null; then
    echo "Installing vim"
    sudo apt-get update
    sudo apt-get install vim
fi

echo "Installing vim profile"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

rm ~/.vimrc
ln -s $DIR/.vimrc $HOME/.vimrc
ln -s $DIR/.vim/ $HOME/.vim


if [ ! -d $HOME/.vim/bundle/Vundle.vim ]; then
    echo "Clonning Vundle"
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo "Installing vim plugins"
vim +PluginInstall +qall
