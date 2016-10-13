
function edocker.clean

    set containers (docker ps -a| grep $argv[1])

    if [ (count $containers) -gt 1 ]

        if [ (count $argv) -gt 1 ]
            set force "--force "
        else
            set force ""
        end

        echo (omf::dim)"Cleaning containers."(omf::off)

        for container in $containers
            set -l CID (echo $container |awk '{print $1}')
            docker rm $force$CID
        end

    end
end
