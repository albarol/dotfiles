
function edocker.remove

    set containers (docker ps -a -q --filter "name=$argv[1]")

    if [ (count $containers) -gt 0 ]
        echo (omf::dim)"Removing containers."(omf::off)
        for container in $containers
            echo $container
            if [ (count $argv) -gt 1 ]
                docker rm --force $container 2>&3 > /dev/null
            else
                docker rm $container 2>&3 > /dev/null
            end
        end
    end

end
