function docker-remove --description "Remove container or image based on pattern"

    if [ (count $argv) -ne 1 ]
        printf "Usage: docker-remove pattern\n"
        printf "Arguments:\n"
        printf \t"pattern"\t"Pattern\n"
        return 1
    end

    set total (docker ps -a -q --filter "name=$argv[1]" | wc -l)

    if [ $total -gt 0 ]
        docker ps -a -q --filter "name=$argv[1]" | xargs docker rm >&2 > /dev/null
        printf "$total containers were removed"
    else
        printf "\n\e[0;31mERROR:\e[0m there is no containers to be removed"
    end
    return 0
end
