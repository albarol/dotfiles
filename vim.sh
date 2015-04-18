
echo "Installing vim"

sudo apt-get update
sudo apt-get install vim

echo "Installing vim profile"

cp .vimrc ~/.vimrc
cp -Rpd .vim/ ~/.vim

echo "Installing vim plugins"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

