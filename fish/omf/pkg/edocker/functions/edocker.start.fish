
function edocker.start
    set containers (docker ps -a -q --filter "name=$argv[1]")

    if [ (count $containers) -gt 0 ]
        echo (omf::dim)"Starting $argv[1] containers."(omf::off)\n
        for container in $containers
            docker start (echo $container | awk '{print $1}') 1> /dev/null
            echo "$container"
        end
    else
        echo (omf::err)"There is no container $argv[1]."(omf::off)
    end
end
