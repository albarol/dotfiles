function docker-stop-all --description "Stop all containers"
    docker ps -a -q |tail -n +2 |xargs docker stop
end
