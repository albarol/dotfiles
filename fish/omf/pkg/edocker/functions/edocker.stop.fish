
function edocker.stop

    if [ $argv[1] = "running" ]
        set containers (docker ps -a -q --filter "status=running")
    else
        set containers (docker ps -a -q)
    end

    if [ (count $containers) -gt 0 ]
        echo (omf::dim)"Stop $argv[1] containers."(omf::off)
        for container in $containers
            docker stop $container
        end
    end

end
