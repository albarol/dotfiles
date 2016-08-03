function docker-logs --description "Show logs for specific container"

    function info_help
        echo "Usage: docker-logs container_name"
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        functions -e info_help
    end

    if [ (count $argv) -ne 1 ]
        info_help
        return 1
    end

    set -l containers (docker ps -a | grep $argv[1] | tr '\n' ';' )

    if [ (echo $containers | tr ';' '\n' | wc -l) -eq 2 ]
        echo $containers | tr ';' '\n' | awk '{print $1}' | xargs docker logs -f
        return 0
    else
        echo "Please choose one of them:"
        echo $containers | tr ';' '\n' | awk '{print $NF}'
        return 1
    end
end
