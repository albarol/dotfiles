
function fssh.cli.add.ssh
    set fail_count 0

    if [ (count $argv) -lt 3 ]
        echo (omf::err)"Invalid arguments"(omf::off)
        echo "Usage: fssh add ssh <alias> <user> <host> (tunnel)"
        set fail_count $OMF_MISSING_ARG
    else
        if [ (count $argv) -eq 3 ]
            settings add $FSSH_DB $argv[1] ssh $argv[2] "" $argv[3] ""
        else
            settings add $FSSH_DB $argv[1] ssh $argv[2] "" $argv[3..-1]
        end
    end

    return $fail_count
end
