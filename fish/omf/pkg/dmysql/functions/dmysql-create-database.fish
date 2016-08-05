
function dmysql-create-database -d "Create database for specific instance of MYSQL Server"

    if not [ (count $argv) -ge 2 ]
        echo "Usage: dmysql-create-database container_name db_name [--password=root_password] "
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        echo \t"database_name"\t"Database name"
        echo \t"[--password]"\t"Root password (default: root)"
        return 1
    end

    set CONTAINER_NAME $argv[1]
    set DATABASE_NAME $argv[2]
    set SERVER_PASSWORD "root"

    if [ (count $argv) -gt 2 ]
        for item in (get_options $argv[3])
            echo $item | tr '=' ' ' | read -l option value
            switch $option
                case password
                    set -x SERVER_PASSWORD $value
            end
        end
    end

    set CREATE_COMMAND sh -c "echo 'CREATE DATABASE IF NOT EXISTS $DATABASE_NAME;' | mysql -uroot --password=$SERVER_PASSWORD"
    docker exec -it $CONTAINER_NAME $CREATE_COMMAND
end
