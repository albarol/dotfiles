
function settings -d "Custom settings"

    if [ "x$argv[-1]" = "x--help" ]; and [ (count $argv) = 2 ]
        set command help
        set arguments $argv[1]
    else if [ (count $argv) -ge 2 ]
        set command $argv[1]
        set arguments $argv[2..-1]
    else if [ (count $argv) = 1 ]
        set command $argv[1]
        set arguments
    else
        set command help
        set arguments
    end

    switch "$command"
        case "-h*" "--h*" "help"
            settings.cli.help $arguments

        case "create"
            settings.cli.create $arguments

        case "a" "add"
            settings.cli.add $arguments

        case "r" "remove"
            settings.cli.remove $arguments

        case "g" "get"
            settings.cli.get $arguments

        case "show"
            settings.cli.show $arguments

        case "*"
            settings.cli.help $arguments
    end
end
