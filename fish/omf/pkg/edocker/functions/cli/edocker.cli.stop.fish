
function edocker.cli.stop
    set fail_count 0

    if [ (count $argv) -ne 1 ];
        echo (omf::err)"Usage: edocker stop (running|all)"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else if [ $argv[1] != "running" ]; and [ $argv[1] != "all" ]
        echo (omf::err)"Usage: edocker stop (running|all)"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else
        edocker.stop $argv[1]
    end

    return $fail_count
end
