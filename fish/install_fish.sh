
if [ ! -x /usr/bin/fish ]; then
    echo "Installing fish"
    sudo apt-get update
    sudo apt-get install git curl fish
    chsh -s `which fish`
fi
