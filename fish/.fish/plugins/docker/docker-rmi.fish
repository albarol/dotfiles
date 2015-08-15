function docker-rmi --description 'Remove images base on time (E.g. minutes, days, weeks, months)'
    echo "Removing docker images: " $argv[1]
    docker images -a | grep $argv[1]' ago' | awk '{print $3}' | xargs docker rmi
    echo "Docker images removed"
end

