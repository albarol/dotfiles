function docker.clean --description "Remove container based on the period"

    function info_help
        echo "Usage: docker.clean (week|month|year)"
        echo "Arguments:"
        echo \t"period"\t"(week|month|year)"
        functions -e info_help
    end

    if [ $argv = "week" ]; or [ $argv = "month" ]; or [ $argv = "year" ]

        set -l containers (docker ps -a | grep $argv[1] | tr '\n' ';' )
        set -l total (echo $containers | tr ';' '\n' | wc -l)

        if [ $total -gt 1 ]
            echo $containers | tr ';' '\n' | awk '{print $1}' | xargs docker rm
        end

        echo (expr $total - 1)" images were removed"

    else
        info_help
    end
end
