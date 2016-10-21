function fssh.connect

    set params (settings get $FSSH_DB $argv[1] | tr ';' '\n')

    if [ $params[1] = 'mysql' ]
        fssh.backends.mysql $params[2..-1]
    else if [ $params[1] = 'ssh' ]
        fssh.backends.ssh $params[2..-1]
    else
        echo $params
    end
end
