function ssh-tunnel -d "Create ssh tunnel"

    ###################
    # Check parameters
    ###################
    if [ (count $argv) -ne 1 ]
        echo "Usage: ssh-tunnel alias"
        echo "Arguments:"
        echo \t"alias:"\t"Alias to represent the tunnel"
        return 1
    end

    #################
    # Getting from database
    #################
    set alias (grep -i "^$argv[1];" $OMF_SSH_TUNNEL_DB)

    if [ (count $alias) -eq 0 ]
        echo "Alias not \"$argv[1]\" exists."
        return 1
    end

    set config (echo $alias | tr ";" "\n")
    set host_pieces (echo $config[3] | tr ":" "\n")

    echo "Connecting on the $host_pieces[1]:$host_pieces[2]"
    echo "Use 127.0.0.1:$host_pieces[3] to connect on the server"
    ssh -L $host_pieces[3]:$host_pieces[1]:$host_pieces[2] $config[2] -N
    return 0
end

