
function settings.get
    cat $argv[1] |grep -i "$argv[2]" |sed "s/$argv[2];//i"
end
