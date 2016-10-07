
function settings.remove

    set TMP /tmp/(uuidgen).tmp

    grep -i -v "^$argv[2];" $argv[1] > $TMP
    mv $TMP $argv[1]
    return 0
end
