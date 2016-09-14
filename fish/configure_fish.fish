#!env /usr/bin/fish

if not [ -d ~/.local.share/omf ]
    echo "Cloning oh-my-fish"
    curl -L https://github.com/fakeezz/oh-my-fish/raw/master/bin/install | fish
end

echo "Installing fish configurations"

rm -rf ~/.config/omf
ln -s $PWD/omf ~/.config/omf

sleep 3

omf install
