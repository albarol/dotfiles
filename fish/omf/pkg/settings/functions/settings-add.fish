
function settings-add -d "Add key/value inside specific config"

    if [ (count $argv) -ne 3 ]
        return 1
    end

    set CONFIG $argv[1]
    set KEY $argv[2]
    set PARAMS $argv[3]

    set HAS_KEY (grep -i "^$KEY;" $CONFIG)

    if [ (count $HAS_KEY) -gt 0 ]
        echo "Alias \"$KEY\" already exists."
        return 1
    end

    echo "$KEY;$PARAMS" >> $CONFIG
    echo "$KEY added into $CONFIG"
    return 0
end
