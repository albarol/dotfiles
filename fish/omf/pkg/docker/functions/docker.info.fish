function docker.info --description "Search for specific information inside docker container"

    function info_help
        echo "Usage: docker.info arguments..."
        echo "Arguments:"
        echo \t"-c name: Container name"
        echo \t"-p pattern: Pattern (eg. IpAddress)"
        functions -e info_help
    end

    function get_options
        echo $argv | sed 's|--*|\\'\n'|g' | sed 's/[ \t]*$//' | grep -v '^$'
        functions -e get_options
    end

    if begin; contains -- -c $argv; and contains -- -p $argv; end
        for item in (get_options $argv)
            echo $item | read -l option value
            switch $option
                case c
                    set -x CONTAINER $value
                case p
                    set -x PATTERN $value
                case "" h
                    info_help
                    return 0
            end
        end

        echo "$CONTAINER: $PATTERN"

        docker ps -a | grep $CONTAINER | awk '{print $1}' | xargs docker inspect | grep -i $PATTERN
        return 0
    end

    info_help
end
