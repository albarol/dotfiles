function docker-remove --description "Remove container or image based on pattern"

    if [ (count $argv) -ne 1 ]
        printf "Usage: docker-remove pattern\n"
        printf "Arguments:\n"
        printf \t"pattern"\t"Pattern\n"
        return 1
    end

    set total (docker ps -a -q --filter "name=$argv[1]" | wc -l)

    printf "\e[0;33mRemoving containers\e[0m\n"
    if [ $total -gt 0 ]
        docker ps -a -q --filter "name=$argv[1]" | xargs docker rm 2>&3 > /dev/null
        printf "\n\e[0;32mSUCCESS\e[0m: Containers has been removed\n"
    else
        printf "\n\e[0;31mERROR:\e[0m There is no containers to be removed"
    end

    return 0
end
