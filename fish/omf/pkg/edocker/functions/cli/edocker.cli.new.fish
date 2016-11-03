
function edocker.cli.new

    if [ (count $argv) -ne 2 ]
        echo (omf::err)"Usage: edocker new <backend> <container>"(omf::off)
        echo " Backend supported: MySQL, Postgre"
        set fail_count $OMF_MISSING_ARG
    else if not contains -- $argv[1] "mysql" "postgre"
        echo (omf::err)"Usage: edocker new <backend> <container>"(omf::off)
        echo " Backend supported: MySQL, Postgre"
        set fail_count $OMF_INVALID_ARG
    else

        set container (docker ps -a | grep -w $argv[2])

        if [ (count $container) -gt 0 ]
            echo (omf::err)"Usage: edocker new <backend> <container>"(omf::off)
            echo "Container $argv[2] already exists"
            set fail_count $OMF_INVALID_ARG
        else
            edocker.new $argv
        end
    end

end
