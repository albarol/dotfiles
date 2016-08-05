function docker-clean --description "Remove container based on the period"

    set arg (echo $argv | grep -oE "(week|month|year)")
    if [ (count $arg) -ne 1  ]
        echo "Usage: docker-clean period"
        echo "Arguments:"
        echo \t"period"\t"(week|month|year)"
        return 1
    end

    set containers (docker ps -a | grep $arg | tr '\n' ';' )
    set total (echo $containers | tr ';' '\n' | wc -l)

    if [ $total -gt 1 ]
        echo $containers | tr ';' '\n' | awk '{print $1}' | xargs docker rm
    end

    echo (expr $total - 1)" images were removed"
end
