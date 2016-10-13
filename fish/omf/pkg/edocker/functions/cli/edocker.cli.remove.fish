
function edocker.cli.remove
    set fail_count 0

    if [ (count $argv) -lt 1 ]
        echo (omf::err)"Usage: edocker remove <container> [--force]"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else if [ (count $argv) -gt 1 ]; and [ $argv[2] != "--force" ]
        echo (omf::err)"Usage: edocker remove <container> [--force]"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else
        edocker.remove $argv
    end

    return $fail_count
end
