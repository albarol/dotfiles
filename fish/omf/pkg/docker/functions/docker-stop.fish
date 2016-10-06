function docker-stop --description "Stop containers"

    set arg (echo $argv | grep -oE "(running|all)")
    if [ (count $arg) -ne 1  ]
        printf "Usage: docker-stop status\n"
        printf "Arguments:\n"
        printf "\tstatus\t(running|all)\n"
        return 1
    end


    printf "\e[0;33mStopping $arg containers\e[0m\n"
    if [ $arg = "running" ]
        docker ps -a -q --filter "status=running" |xargs docker stop 2>&3 > /dev/null
    else
        docker ps -a -q |xargs docker stop 2>&3 > /dev/null
    end

    printf "\n\e[0;32mSUCCESS\e[0m: $arg containers has been stopped\n"
    return 0
end
