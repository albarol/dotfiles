function ssh-tunnel-add -d "Create ssh tunnel"

    set DATABASE ~/.omf/ssh-tunnel.db
    set SEP ";"

    ###################
    # Check parameters
    ###################
    if [ (count $argv) -ne 3 ]
        echo "Usage: ssh-tunnel-add alias tunnel host"
        echo "Arguments:"
        echo \t"alias:"\t"Alias to represent the tunnel"
        echo \t"tunnel:"\t"Server Tunnel"
        echo \t"host:"\t"Server to connect"
        return 1
    end


    #################
    # Initial setup
    #################
    if not [ -d ~/.omf ]
        mkdir ~/.omf
    end

    touch $DATABASE

    #################
    # Adding into database
    #################
    set HAS_KEY (grep -i "^$argv[1]$SEP" $DATABASE)

    if [ (count $HAS_KEY) -gt 0 ]
        echo "Alias \"$argv[1]\" already exists."
        return 1
    end

    set host_pieces (echo $argv[3] | tr ":" "\n")

    if [ (count $host_pieces) -ne 3 ]
       echo "Use the following pattern to set host:"
       echo \t"{HOST_ADDR}:{HOST_PORT}:{LOCAL_PORT}"
       return 1
    end

    echo "$argv[1]$SEP$argv[2]$SEP$argv[3]" >> $DATABASE
    echo "$argv[1] added into $DATABASE"
    return 0
end

