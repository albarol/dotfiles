
function fssh -d "Ssh Custom commands"

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
            fssh.cli.help $arguments

        case "c" "connect"
            fssh.cli.connect $arguments

        case "a" "add"
            fssh.cli.add $arguments

        case "r" "remove"
            settings remove $FSSH_DB $arguments

        case "show"
            fssh.cli.show $arguments

        case "*"
            fssh.cli.help $arguments
    end
end
