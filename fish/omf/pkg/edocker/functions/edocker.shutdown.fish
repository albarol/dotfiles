
function edocker.shutdown

    set containers (docker ps -a -q --filter "status=running")

    if [ (count $containers) -gt 0 ]
        echo (omf::dim)"Stop running containers."(omf::off)
        for container in $containers
            docker stop $container
        end
    end

end
