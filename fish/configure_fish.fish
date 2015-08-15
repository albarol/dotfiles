#!env /usr/bin/fish

if not test -d ~/.oh-my-fish
    echo "Cloning oh-my-fish"
    curl -L https://github.com/fakeezz/oh-my-fish/raw/master/tools/install.fish | fish
end

echo "Installing fish configurations"

cp config.fish ~/.config/fish/config.fish
cp -Rpd .fish/* ~/.fish/

sleep 3
. ~/.config/fish/config.fish

omf install

. ~/.config/fish/config.fish
