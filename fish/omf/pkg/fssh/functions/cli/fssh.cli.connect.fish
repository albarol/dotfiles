
function fssh.cli.connect
    set fail_count 0

    if [ (count $argv) -ne 1 ]
        echo (omf::err)"Invalid arguments"(omf::off)
        echo "Usage: fssh connect <alias>"
        set fail_count $OMF_MISSING_ARG
    else
        fssh.connect $argv
    end

    return $fail_count
end
