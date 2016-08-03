function ssh.mysqltunnel -d "Create ssh tunnel"

    function info_help
        echo "Usage: ssh.mysqltunnel tunnel db"
        echo "Arguments:"
        echo \t"tunnel:"\t"Server that works as tunnel"
        echo \t"db:"\t"Server that has mysql database"
        functions -e info_help
    end

    if [ (count $argv) -eq 2 ]
        echo "$argv[2] can be connected using localhost:3307"
        ssh -L 3307:$argv[2]:3306 $argv[1] -N
    else
        info_help
    end

end

