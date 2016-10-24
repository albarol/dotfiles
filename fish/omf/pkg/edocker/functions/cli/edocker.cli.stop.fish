
function edocker.cli.stop
    set fail_count 0

    if [ (count $argv) -ne 1 ];
        echo (omf::err)"Usage: edocker stop <container>"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else
        edocker.stop $argv[1]
    end

    return $fail_count
end
