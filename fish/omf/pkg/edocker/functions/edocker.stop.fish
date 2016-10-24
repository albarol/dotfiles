
function edocker.stop

    set containers (docker ps -a -q --filter "name=$argv[1]")

    if [ (count $containers) -gt 0 ]
        echo (omf::dim)"Stop $argv[1] containers."(omf::off)
        for container in $containers
            docker stop $container
        end
    else
        echo (omf::err)"There is no container $argv[1]."(omf::off)
    end
end
