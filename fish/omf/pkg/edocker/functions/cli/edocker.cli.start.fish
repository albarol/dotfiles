
function edocker.cli.start
    set fail_count 0

    if [ (count $argv) -ne 1 ]
        echo (omf::err)"Usage: edocker start <container>"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else
        edocker.start $argv[1]
    end

    return $fail_count
end
