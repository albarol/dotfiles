
function edocker -d "Extended docker"

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
            edocker.cli.help $arguments

        case "i" "inspect"
            edocker.cli.inspect $arguments

        case "r" "remove"
            edocker.cli.remove $arguments

        case "l" "logs"
            edocker.cli.logs $arguments

        case "stop"
            edocker.cli.stop $arguments

        case "clean"
            edocker.cli.clean $arguments

        case "show"
            edocker.show

        case "*"
            edocker.cli.help $arguments
    end
end
