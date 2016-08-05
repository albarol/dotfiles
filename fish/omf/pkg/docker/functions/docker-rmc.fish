function docker-rmc --description "Remove container based on name"

    if [ (count $argv) -ne 1 ]
        echo "Usage: docker-rmc container_name"
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        return 1
    end

    set total (docker ps -a | grep -w $argv[1] | wc -l)

    if [ $total -gt 1 ]
        echo "More than one containers match. Please input a unique name."
        return 1
    else if [ $total -eq 0 ]
        echo "There is no container with this name."
        return 1
    end

    docker ps -a |grep -w $argv[1] |awk '{print $1}' | xargs --no-run-if-empty docker rm 1>/dev/null
    echo "Container $argv[1] removed"

    return 0
end
