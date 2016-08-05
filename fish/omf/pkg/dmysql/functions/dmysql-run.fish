
function dmysql-run -d "Run script inside specific instance of MYSQL Server"

    if not [ (count $argv) -ge 2 ]
        echo "Usage: dmysql-run container_name filename [--password=root_password] "
        echo "Arguments:"
        echo \t"container_name"\t"Container name"
        echo \t"filename"\t"filename"
        echo \t"[--password]"\t"Root password (default: root)"
        return 1
    end

    set CONTAINER_NAME $argv[1]
    set FILENAME $argv[2]
    set SERVER_PASSWORD "root"

    if [ (count argv) -gt 2 ]
        for item in (__get_options $argv[3])
            echo $item | tr '=' ' ' | read -l option value
            switch $option
                case password
                    set -x SERVER_PASSWORD $value
            end
        end
    end

    set OUTPUTNAME $FILENAME".out"
    set RUN_COMMAND sh -c "mysql -uroot --password=$SERVER_PASSWORD < $FILENAME > $OUTPUTNAME"

    docker cp $FILENAME $CONTAINER_NAME:/$FILENAME
    docker exec -it $CONTAINER_NAME $RUN_COMMAND
    docker cp $CONTAINER_NAME:/$OUTPUTNAME $OUTPUTNAME

    echo "Generated $OUTPUTNAME file."
end
