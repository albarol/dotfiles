function ssh-tunnel-connect -d "Create ssh tunnel"

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
    set params (settings-get $OMF_SSH_TUNNEL_DB $argv[1])

    if [ (count $params) -eq 0 ]
        echo "Alias \"$argv[1]\" does not exists."
        return 1
    end

    set config (echo $params | tr ";" "\n")
    set host_pieces (echo $config[2] | tr ":" "\n")
    set port_not_available (netstat -ln |grep ":$host_pieces[3]"|grep "LISTEN")
    set port $host_pieces[3]

    if [ (count $port_not_available) -gt 0 ]
       set port (shuf -i $host_pieces[3]-3399 -n 1)
    end


    echo "Connecting on the $host_pieces[1]:$host_pieces[2]"
    echo "Use 127.0.0.1:$port to connect on the server"
    ssh -L $port:$host_pieces[1]:$host_pieces[2] $config[1] -N
    return 0
end
