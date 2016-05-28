function docker.rmc --description "Remove container based on name"

    function info_help
        echo "Usage: docker.rmc container_name"
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        functions -e info_help
    end

    if [ (count $argv) -eq 1 ]

        set -l containers (docker ps -a | grep $argv[1] | tr '\n' ';' )

        if [ (echo $containers | tr ';' '\n' | wc -l) -eq 2 ]
            set -l removed (echo $containers | tr ';' '\n' | awk '{print $1}' | xargs --no-run-if-empty docker rm)
            echo "Container $removed removed"
        else if [ (echo $containers | tr ';' '\n' | wc -l) -eq 1 ]
            echo "$argv[1] didn't match any container"
        else
            echo "Please choose one of them:"
            echo $containers | tr ';' '\n' | awk '{print $NF}'
        end

    else
        info_help
    end
end
