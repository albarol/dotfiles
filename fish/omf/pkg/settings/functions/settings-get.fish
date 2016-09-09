
function settings-get -d "Get value inside specific config for specific key"

    if [ (count $argv) -ne 2 ]
        return 1
    end

    set CONFIG $argv[1]
    set KEY $argv[2]

    set PARAMS (grep -i "^$KEY;" $CONFIG)

    if [ (count $PARAMS) -eq 0 ]
        return 1
    end

    echo $PARAMS | sed "s/$KEY;//"
    return 0
end
