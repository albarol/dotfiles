function docker-rmc --description 'Remove container base on time (E.g. minutes, days, weeks, months)'
    echo "Removing docker containers"
    docker ps -a | grep $argv[1]' ago' | awk '{print $1}' | xargs --no-run-if-empty docker rm
    echo "Containers removed"
end

