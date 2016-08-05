function ssh-tunnel-list -d "List all ssh-tunnel configured"

    set DATABASE ~/.omf/ssh-tunnel.db

    cat $DATABASE |awk -F';' '{print $1}'
    return 0
end

