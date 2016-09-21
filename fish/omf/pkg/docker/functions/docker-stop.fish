function docker-stop --description "Stop containers"

    set arg (echo $argv | grep -oE "(running|all)")
    if [ (count $arg) -ne 1  ]
        echo "Usage: docker-stop status"
        echo "Arguments:"
        echo \t"status"\t"(running|all)"
        return 1
    end


    if [ $arg = "running" ]
        echo "Stop running containers"
        docker ps -a -q --filter "status=running" |xargs docker stop
    else
        echo "Stop all containers"
        docker ps -a -q |xargs docker stop
    end
end
