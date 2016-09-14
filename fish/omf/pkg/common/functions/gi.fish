function gi --description "Create gitignore based on specific type of programming language"

    function info_help
        echo "Usage: gi (language|--list)"
        echo "Arguments:"
        echo \t"language"\t"Programming language (e.g. python, c#)"
        echo \t"--list"\t"Show all programming languages supported"
        functions -e info_help
    end

    if [ (count $argv) -eq 0 ]
        info_help
        return 1
    end

    if [ $argv = "--list" ]
        curl -L -s https://www.gitignore.io/api/list | sed 's/,/\n/g'
    else
        curl -L -s https://www.gitignore.io/api/$argv[1]
    end
end
