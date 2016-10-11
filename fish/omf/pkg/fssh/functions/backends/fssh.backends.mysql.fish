function fssh.backends.mysql

    if [ -z $argv[-1] ]
        mysql --user=$argv[1] --password=$argv[2] --host=$argv[3]
    else
        set port (shuf -i 3307-3399 -n 1)
        ssh -f -L $port:$argv[3]:3306 $argv[4] sleep 2;\
        mysql --user=$argv[1] --password=$argv[2] --host=127.0.0.1 --port=$port
    end

end
