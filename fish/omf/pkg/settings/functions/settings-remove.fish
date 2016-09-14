
function settings-remove -d "Remove Key/Value inside config"

    if [ (count $argv) -ne 2 ]
        return 1
    end

    set CONFIG $argv[1]
    set KEY $argv[2]
    set TMP /tmp/(uuidgen).tmp

    grep -i -v "^$KEY;" $CONFIG > $TMP
    mv $TMP $CONFIG

    echo "$KEY removed from $CONFIG"
    return 0
end
