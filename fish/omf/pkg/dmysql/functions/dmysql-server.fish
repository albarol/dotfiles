function dmysql-server -d "Start a new instance of MYSQL Server"

   if not [ (count $argv) -gt 0 ]
       echo "Usage: dmysql-server name [--tag=tag] [--password=root_password]"
       echo "Arguments:"
       echo \t"name"\t"Container name"
       echo \t"[--password]"\t"Root password (default: root)"
       echo \t"[--tag]"\t"Tag version (default: 5.7.6)"
       return 1
   end

    set CONTAINER_NAME $argv[1]
    set SERVER_PASSWORD "root"
    set SERVER_TAG "5.7.6"

    if [ (count $argv) -gt 1 ]
        for item in (__get_options $argv[2..-1])
            echo $item | tr '=' ' ' | read -l option value
            switch $option
                case password
                    set -x SERVER_PASSWORD $value
                case tag
                    set -x SERVER_TAG $value
            end
        end
    end

    docker run -p 3306:3306 --name $CONTAINER_NAME -e MYSQL_ROOT_PASSWORD=$SERVER_PASSWORD -d mysql/mysql-server:$SERVER_TAG
end
