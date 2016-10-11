
function fssh.cli.add.mysql
    set fail_count 0

    if [ (count $argv) -lt 4 ]
        echo (omf::err)"Invalid arguments"(omf::off)
        echo "Usage: fssh add mysql <alias> <user> <pwd> <host> (tunnel)"
        set fail_count $OMF_MISSING_ARG
    else
        if [ (count $argv) -eq 4 ]
            settings add $FSSH_DB $argv[1] mysql $argv[2..-1] ""
        else
            settings add $FSSH_DB $argv[1] mysql $argv[2..-1]
        end
    end

    return $fail_count
end
