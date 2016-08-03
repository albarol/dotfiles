
function dmysql-info -d "Info from instance of MYSQL Server"

   function info_help
        echo "Usage: dmysql-info name"
        echo "Arguments:"
        echo \t"name"\t"Container name"
        functions -e info_help
   end

   if [ (count $argv) -eq 1 ]
        set -x CONTAINER_NAME $argv[1]

        set -x INFO (docker inspect --format '' $CONTAINER_NAME | tr '\n' ';' )
        set -x IP_ADDRESS (echo $INFO |tr ';' '\n' |grep -i "ipaddress" | tail -n1 | sed 's/[ \t,\"]*//g' |awk -F':' '{print $2}')
        set -x MYSQL_PASSWORD (echo $INFO |tr ';' '\n'|grep -i "mysql_root" | sed 's/[ \t,\"]*//g' |awk -F'=' '{print $2}')

        echo "IpAddress: $IP_ADDRESS"
        echo "MYSQL_Root_Password: $MYSQL_PASSWORD"
    else
        info_help
    end

end
