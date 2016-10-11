function fssh.connect

    set params (settings get $FSSH_DB $argv[1] | tr ';' '\n')

    if [ $params[1] = 'mysql' ]
        fssh.backends.mysql $params[2..-1]
    else
        fssh.backends.ssh $params[2..-1]
    end
end
