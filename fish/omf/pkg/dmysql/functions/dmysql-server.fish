
function dmysql-server -d "Start a new instance of MYSQL Server"

   function info_help
        echo "Usage: dmysql-server name [--tag=tag] [--password=root_password]"
        echo "Arguments:"
        echo \t"name"\t"Container name"
        echo \t"[--password]"\t"Root password (default: root)"
        echo \t"[--tag]"\t"Tag version (default: 5.7.6)"
        functions -e info_help
   end

   function get_options
       echo $argv | sed 's|--*|\\'\n'|g' | sed 's/[ \t]*$//' | grep -v '^$'
       functions -e get_options
   end

   if [ (count $argv) -gt 0 ]
        set -x CONTAINER_NAME $argv[1]
        set -x SERVER_PASSWORD "root"
        set -x SERVER_TAG "5.7.6"

        if [ (count $argv) -gt 1 ]
            for item in (get_options $argv[2..-1])
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
    else
        info_help
    end

end
