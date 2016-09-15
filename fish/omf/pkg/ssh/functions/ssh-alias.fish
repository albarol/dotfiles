function ssh-alias -d "Connect using ssh alias"

    ###################
    # Check parameters
    ###################
    if [ (count $argv) -ne 1 ]
        echo "Usage: ssh-alias alias"
        echo "Arguments:"
        echo \t"alias:"\t"Alias"
        return 1
    end

    #################
    # Getting from database
    #################
    set params (settings-get $OMF_SSH_ALIAS_DB $argv[1] | tr ';' '\n')

    if [ (count $params) -eq 0 ]
        echo "Alias \"$argv[1]\" does not exists."
        return 1
    end

    ssh $params[1]@$params[2]
end
