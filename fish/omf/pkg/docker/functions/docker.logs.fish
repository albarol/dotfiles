function docker.logs --description "Show logs for specific container"

    function info_help
        echo "Usage: docker.logs arguments..."
        echo "Arguments:"
        echo \t"-c container_name"\t"Container name"
        functions -e info_help
    end

    function get_options
        echo $argv | sed 's|--*|\\'\n'|g' | sed 's/[ \t]*$//' | grep -v '^$'
        functions -e get_options
    end

    if begin; contains -- -c $argv; end
        for item in (get_options $argv)
            echo $item | read -l option value
            switch $option
                case c
                    set -x CONTAINER $value
                case "" h
                    info_help
                    return 0
            end
        end

        set -l containers (docker ps -a | grep $CONTAINER | tr '\n' ';' )

        if [ (echo $containers | tr ';' '\n' | wc -l) -eq 2 ]
            echo $containers | tr ';' '\n' | awk '{print $1}' | xargs docker logs -f
        else
            echo "Please choose one of them:"
            echo $containers | tr ';' '\n' | awk '{print $NF}'
        end

        return 0
    end

    info_help
end
