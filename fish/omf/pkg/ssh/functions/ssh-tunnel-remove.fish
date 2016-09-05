function ssh-tunnel-remove -d "Remove alias for ssh-tunnel"

    set TMP /tmp/ssh-tunnel.tmp

    ###################
    # Check parameters
    ###################
    if [ (count $argv) -ne 1 ]
        echo "Usage: ssh-tunnel-remove alias"
        echo "Arguments:"
        echo \t"alias:"\t"Alias to represent the tunnel"
        return 1
    end

    touch $OMF_SSH_TUNNEL_DB

    #################
    # Removing from database
    #################
    grep -i -v "^$argv[1];" $OMF_SSH_TUNNEL_DB > $TMP
    mv $TMP $OMF_SSH_TUNNEL_DB

    echo "$argv[1] removed from $OMF_SSH_TUNNEL_DB"
    return 0
end

