
echo "Installing fish"

sudo apt-get update
sudo apt-get install git curl

curl -L https://github.com/bpinto/oh-my-fish/raw/master/tools/install.fish | fish

echo "Installing fish configurations"

git clone git://github.com/bpinto/oh-my-fish.git ~/.oh-my-fish

cp config.fish ~/.config/fish/config.fish
cp -Rpd .fish/ ~/.fish/
