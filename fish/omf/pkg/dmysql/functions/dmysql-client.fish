
function dmysql-client -d "Start a new client connection with MYSQL Server"

   function info_help
        echo "Usage: dmysql-client name [--username=username] [--password=password]"
        echo "Arguments:"
        echo \t"name"\t"Container name"
        echo \t"[--username]"\t"Username (default: root)"
        echo \t"[--password]"\t"Root password (default: root)"
        functions -e info_help
   end

   function get_options
       echo $argv | sed 's|--*|\\'\n'|g' | sed 's/[ \t]*$//' | grep -v '^$'
       functions -e get_options
   end

   if [ (count $argv) -gt 0 ]
        set -x CONTAINER_NAME $argv[1]
        set -x SERVER_USERNAME "root"
        set -x SERVER_PASSWORD "root"

       if [ (count $argv) -gt 1 ]
            for item in (get_options $argv[2..-1])
                echo $item | tr '=' ' ' | read -l option value
                switch $option
                    case password
                        set -x SERVER_PASSWORD $value
                    case username
                        set -x SERVER_USERNAME $value
                end
            end
        end

        docker exec -it $CONTAINER_NAME mysql -h$MYSQL_PORT_3306_TCP_ADDR -P$MYSQL_PORT_3306_TCP_PORT --user=$SERVER_USERNAME --password=$SERVER_PASSWORD

    else
        info_help
    end

end
