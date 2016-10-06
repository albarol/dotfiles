function docker-info --description "Search for specific information inside docker container"

    if [ (count $argv) -ne 2 ]
        echo "Usage: docker-info container_name pattern"
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        echo \t"pattern"\t"Pattern (e.g. IpAddress)"
        return 1
    end

    set container $argv[1]
    set pattern $argv[2]

    set result (docker ps -a -q --filter "name=$container" |xargs docker inspect |grep -i $pattern | tr '\n' ';')
    printf "\e[1;33mDocker info\n===========\e[0m\n\n"
    echo "$result" | tr ';' '\n' | sed 's/[ \t\",]//g'
    return 0
end
