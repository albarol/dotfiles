function ssh-tunnel-remove -d "Remove alias for ssh-tunnel"

    set DATABASE ~/.omf/ssh-tunnel.db
    set SEP ";"
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

    #################
    # Initial setup
    #################
    if not [ -d ~/.omf ]
        mkdir ~/.omf
    end

    touch $DATABASE

    #################
    # Removing from database
    #################
    grep -i -v "^$argv[1]$SEP" $DATABASE > $TMP
    mv $TMP $DATABASE

    echo "$argv[1] removed from $DATABASE"
    return 0
end

