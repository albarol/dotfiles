
function settings-list -d "Show all keys from config"
    if [ (count $argv) -gt 0 ]
        cat $argv[1] |awk -F';' '{print $1}'| sort
    end
    return 0
end
