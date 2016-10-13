
function edocker.cli.inspect
    set fail_count 0

    if [ (count $argv) -ne 1 ]; and [ (count $argv) -ne 3 ]
        echo (omf::err)"Usage: edocker inspect <container> [--format]"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else if [ (count $argv) -gt 1 ]; and [ $argv[2] != "--format" ]
        echo (omf::err)"Usage: edocker inspect <container> [--format]"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else

        if [ (count $argv) -eq 3 ]
            edocker.inspect $argv[1] $argv[3]
        else
            edocker.inspect $argv[1]
        end
    end

    return $fail_count
end
