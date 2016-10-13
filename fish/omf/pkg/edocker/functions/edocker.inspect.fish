
function edocker.inspect

    set CID (docker ps -a -q --filter "name=$argv[1]")
    if [ -z $CID ]
        echo (omf::err)"There is no container $argv[1]."(omf::off)
        return $OMF_INVALID_ARG
    end

    if [ (count $argv) -eq 2 ]
        docker inspect --format $argv[2] $CID
    else
        docker inspect $CID
    end

end
