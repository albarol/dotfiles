function docker.rmi --description "Remove image based on the period"

    function info_help
        echo "Usage: docker.rmi (week|month|year)"
        echo "Arguments:"
        echo \t"period"\t"(week|month|year)"
        functions -e info_help
    end

    if [ $argv = "week" ]; or [ $argv = "month" ]; or [ $argv = "year" ]

        set -l containers (docker images -a | grep $argv[1] | tr '\n' ';' )
        set -l total (echo $containers | tr ';' '\n' | wc -l)

        if [ $total -gt 0 ]
            echo $containers | tr ';' '\n' | awk '{print $3}' | xargs docker rmi -f
        end

        echo "$total images were removed"

    else
        info_help
    end
end
