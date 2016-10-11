
function fssh.cli.show
    set fail_count 0

    echo (omf::dim)"Show fssh aliases."(omf::off)

    if contains -- $argv[1] 'mysql' 'ssh'
        settings.show $FSSH_DB |awk 'NR>1{print $2,$1}'| grep $argv[1] |sort | column -t
    else
        settings.show $FSSH_DB |awk 'NR>1{print $2,$1}'| sort | column -t
    end

    return $fail_count
end
