
function edocker.cli.logs
    set fail_count 0

    if [ (count $argv) -ne 1 ];
        echo (omf::err)"Usage: edocker logs <container>"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else
        edocker.logs $argv[1]
    end

    return $fail_count
end
