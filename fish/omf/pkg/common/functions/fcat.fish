function fcat --description "Find inside the tree and cat it if is found"

    function info_help
        echo "Usage: fcat FILENAME"
        echo "Arguments:"
        echo \t"FILENAME"\t"FILENAME"
        functions -e info_help
    end

    if [ (count $argv) -eq 0 ]
        info_help
        return 1
    end

    find . |grep $argv[1] |xargs cat

    return 0
end
