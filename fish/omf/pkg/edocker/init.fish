function init -a path --on-event init_edocker
    set -gx DOCKER_HOST unix:///var/run/docker.sock

    autoload $path/functions/{cli,backends}
end

