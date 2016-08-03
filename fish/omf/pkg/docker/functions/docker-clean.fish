function docker-clean --description "Remove container based on the period"

    function info_help
        echo "Usage: docker-clean period"
        echo "Arguments:"
        echo \t"period"\t"(week|month|year)"
        functions -e info_help
    end

    set arg (echo $argv | grep -oE "(week|month|year)")
    if [ (count $arg) -ne 1  ]
        info_help
        return 0
    end

    set -l containers (docker ps -a | grep $arg | tr '\n' ';' )
    set -l total (echo $containers | tr ';' '\n' | wc -l)

    if [ $total -gt 1 ]
        echo $containers | tr ';' '\n' | awk '{print $1}' | xargs docker rm
    end

    echo (expr $total - 1)" images were removed"
end
