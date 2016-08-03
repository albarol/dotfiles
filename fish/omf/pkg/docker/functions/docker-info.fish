function docker-info --description "Search for specific information inside docker container"

    function info_help
        echo "Usage: docker-info container_name pattern"
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        echo \t"pattern"\t"Pattern (e.g. IpAddress)"
        functions -e info_help
    end

    if [ (count $argv) -ne 2 ]
        info_help
        return 1
    end

    set container $argv[1]
    set pattern $argv[2]

    set result (docker ps -a | grep $container | awk '{print $1}' | xargs docker inspect | grep -i $pattern | tr '\n' ';')
    echo $result | tr ';' '\n' | sed 's/[ \t]//g'
    return 0
end
