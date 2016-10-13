
function edocker.logs

    set container (docker ps -a |grep -w $argv[1])

    if [ (count $container) -gt 1 ]
        echo (omf::err)"Usage: edocker logs <container>"(omf::off)
        echo "Please, choose a unique name of the container."
        return $OMF_INVALID_ARG
    else if [ (count $container) -eq 1 ]
        set -l CID (echo $container| awk '{print $1}')
        docker logs -f -t $CID
    end

end
