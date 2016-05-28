#!env /usr/bin/fish

if not test -d ~/.oh-my-fish
    echo "Cloning oh-my-fish"
    curl -L https://github.com/fakeezz/oh-my-fish/raw/master/bin/install | fish
end

echo "Installing fish configurations"

cp -Rpd omf/ ~/.config/omf

sleep 3

omf install
