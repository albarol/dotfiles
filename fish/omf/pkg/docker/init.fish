function init -a path --on-event init_docker
    set -gx DOCKER_HOST unix:///var/run/docker.sock
end

