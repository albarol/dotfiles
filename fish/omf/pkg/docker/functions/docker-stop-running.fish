function docker-stop-running --description "Stop all containers that are running"
    docker ps -a -q --filter "status=running" |tail -n +2 |xargs docker stop
end
