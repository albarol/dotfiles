
function dmysql-drop-database -d "Drop database for specific instance of MYSQL Server"

   function info_help
        echo "Usage: dmysql-drop-database container_name db_name [--password=root_password] "
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        echo \t"database_name"\t"Database name"
        echo \t"[--password]"\t"Root password (default: root)"
        functions -e info_help
   end

   function get_options
       echo $argv | sed 's|--*|\\'\n'|g' | sed 's/[ \t]*$//' | grep -v '^$'
       functions -e get_options
   end

   if [ (count $argv) -gt 0 ]
        set -x CONTAINER_NAME $argv[1]
        set -x DATABASE_NAME $argv[2]
        set -x SERVER_PASSWORD "root"

        for item in (get_options $argv[3])
            echo $item | tr '=' ' ' | read -l option value
            switch $option
                case password
                    set -x SERVER_PASSWORD $value
            end
        end

        set -xl CREATE_COMMAND sh -c "echo 'DROP DATABASE $DATABASE_NAME;' | mysql -uroot --password=$SERVER_PASSWORD"

        docker exec -it $CONTAINER_NAME $CREATE_COMMAND
    else
        info_help
    end

end
