function ssh-tunnel-list -d "List all ssh-tunnel configured"
    cat $OMF_SSH_TUNNEL_DB |awk -F';' '{print $1}'| sort
    return 0
end

