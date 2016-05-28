function init -a path --on-event init_docker
    set -gx DOCKER_HOST tcp://localhost:4243
end

