function ssh-tunnel-remove -d "Remove alias for ssh-tunnel"

    ###################
    # Check parameters
    ###################
    if [ (count $argv) -ne 1 ]
        echo "Usage: ssh-tunnel-remove alias"
        echo "Arguments:"
        echo \t"alias:"\t"Alias to represent the tunnel"
        return 1
    end

    settings-remove $OMF_SSH_TUNNEL_DB $argv[1]
    return 0
end

