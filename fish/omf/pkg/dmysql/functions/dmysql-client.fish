function dmysql-client -d "Start a new client connection with MYSQL Server"

   if not [ (count $argv) -ge 1 ]
       echo "Usage: dmysql-client name [--username=username] [--password=password]"
       echo "Arguments:"
       echo \t"name"\t"Container name"
       echo \t"[--user]"\t"Username (default: root)"
       echo \t"[--password]"\t"Root password (default: root)"
       return 1
   end

    set CONTAINER_NAME $argv[1]
    set SERVER_USERNAME "root"
    set SERVER_PASSWORD "root"

    if [ (count $argv) -gt 1 ]
        for item in (__get_options $argv[2])
            echo $item | tr '=' ' ' | read -l option value
            switch $option
                case password
                    set -x SERVER_PASSWORD $value
            end
        end
    end

    docker exec -it $CONTAINER_NAME mysql -h$MYSQL_PORT_3306_TCP_ADDR -P$MYSQL_PORT_3306_TCP_PORT --user=$SERVER_USERNAME --password=$SERVER_PASSWORD
end
