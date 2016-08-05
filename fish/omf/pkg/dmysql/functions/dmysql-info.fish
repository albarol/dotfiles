
function dmysql-info -d "Info from instance of MYSQL Server"

   if not [ (count $argv -eq 1) ]
       echo "Usage: dmysql-info name"
       echo "Arguments:"
       echo \t"name"\t"Container name"
       return 1
   end

    set -x CONTAINER_NAME $argv[1]

    set INFO (docker inspect --format '' $CONTAINER_NAME | tr '\n' ';' )
    set IP_ADDRESS (echo $INFO |tr ';' '\n' |grep -i "ipaddress" | tail -n1 | sed 's/[ \t,\"]*//g' |awk -F':' '{print $2}')
    set MYSQL_PASSWORD (echo $INFO |tr ';' '\n'|grep -i "mysql_root" | sed 's/[ \t,\"]*//g' |awk -F'=' '{print $2}')

    echo "IpAddress: $IP_ADDRESS"
    echo "MYSQL_Root_Password: $MYSQL_PASSWORD"
end
