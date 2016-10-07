
function settings.add
    echo "$argv[2..-1]"|tr " " ";" >> $argv[1]
end
