
function settings.cli.remove
    set fail_count 0

    if [ (count $argv) -ne 2 ]
        echo (omf::err)"Invalid arguments"(omf::off)
        echo "Usage: settings remove [<database> <key>]"
        set fail_count $OMF_MISSING_ARG
    else
        set key (grep -i "^$argv[2];" $argv[1])

        if not [ -e $argv[1] ]
            echo (omf::err)"Database $argv[1] doesn't exist"(omf::off)
            set fail_count $OMF_MISSING_ARG
        else if [ (count $key) -eq 0 ]
            echo (omf::err)"Key $argv[2] doesn't exist."(omf::off)
            set fail_count $OMF_MISSING_ARG
        else
            settings.remove $argv
        end
    end

    return $fail_count
end
