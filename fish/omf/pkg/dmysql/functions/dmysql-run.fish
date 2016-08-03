
function dmysql-run -d "Run script inside specific instance of MYSQL Server"

   function info_help
        echo "Usage: dmysql-run container_name filename [--password=root_password] "
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        echo \t"filename"\t"filename"
        echo \t"[--password]"\t"Root password (default: root)"
        functions -e info_help
   end

   function get_options
       echo $argv | sed 's|--*|\\'\n'|g' | sed 's/[ \t]*$//' | grep -v '^$'
       functions -e get_options
   end

   if [ (count $argv) -gt 1 ]
        set -x CONTAINER_NAME $argv[1]
        set -x FILENAME $argv[2]
        set -x SERVER_PASSWORD "root"

        for item in (get_options $argv[3])
            echo $item | tr '=' ' ' | read -l option value
            switch $option
                case password
                    set -x SERVER_PASSWORD $value
            end
        end

        set -x OUTPUTNAME $FILENAME".out"

        docker cp $FILENAME $CONTAINER_NAME:/$FILENAME
        set -xl RUN_COMMAND sh -c "mysql -uroot --password=$SERVER_PASSWORD < $FILENAME > $OUTPUTNAME"
        docker exec -it $CONTAINER_NAME $RUN_COMMAND
        docker cp $CONTAINER_NAME:/$OUTPUTNAME $OUTPUTNAME
    else
        info_help
    end

end
