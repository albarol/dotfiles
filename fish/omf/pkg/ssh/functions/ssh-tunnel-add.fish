function ssh-tunnel-add -d "Create ssh tunnel"

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

    touch $OMF_SSH_TUNNEL_DB

    #################
    # Adding into database
    #################
    set host_pieces (echo $argv[3] | tr ":" "\n")

    if [ (count $host_pieces) -ne 3 ]
       echo "Use the following pattern to set host:"
       echo \t"{HOST_ADDR}:{HOST_PORT}:{LOCAL_PORT}"
       return 1
    end

    settings-add $OMF_SSH_TUNNEL_DB $argv[1] "$argv[2];$argv[3]"
    return 0
end

