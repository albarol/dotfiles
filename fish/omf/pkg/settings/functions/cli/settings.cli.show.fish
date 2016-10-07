
function settings.cli.show
    set fail_count 0

    if [ (count $argv) -gt 2 ]
        echo (omf::err)"Invalid arguments"(omf::off)
        echo "Usage: settings show [<database>]"
        set fail_count $OMF_MISSING_ARG
    else if not [ -e $argv[1] ]
        echo (omf::err)"Database $argv[1] doesn't exist"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else
        settings.show $argv
    end

    return $fail_count
end
