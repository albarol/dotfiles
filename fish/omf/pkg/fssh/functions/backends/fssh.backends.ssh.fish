function fssh.backends.ssh

    if [ -z $argv[-1] ]
        ssh $argv[1]@$argv[3]
    else
        set port (shuf -i 2000-2100 -n 1)
        ssh -f -L $port:$argv[3]:22 $argv[4] sleep 2;\
        ssh $argv[1]@127.0.0.1:$port
    end

end
