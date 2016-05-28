function docker.stopall --description "Stop all containers that are running"
    docker ps -a | awk '{print $1}' | tail -n +2 | xargs docker stop
end
