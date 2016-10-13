function docker-logs --description "Show logs for specific container"

    if [ (count $argv) -ne 1 ]
        echo "Usage: docker-logs container_name"
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        return 1
    end

    docker ps -a |grep -w $argv[1] |awk '{print $1}' | xargs docker logs -f
end
