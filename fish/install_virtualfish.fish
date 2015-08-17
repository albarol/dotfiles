
sudo apt-get install python-dev python-pip

if not test -d $HOME/.fish/virtualfish
    echo "Installing virtualfish"
    git clone https://github.com/fakeezz/virtualfish $HOME/.fish/virtualfish
end


echo "Installing virtualfish configurations"
printf "\

# Configure the virtualenv.
. $HOME/.fish/virtualfish/virtualfish/virtual.fish; emit virtualfish_did_setup_plugins
" >> $HOME/.config/fish/config.fish
