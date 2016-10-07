
function settings.cli.add
    set fail_count 0

    if [ (count $argv) -lt 3 ]
        echo (omf::err)"Invalid arguments"(omf::off)
        echo "Usage: settings add [<database> <key> <values>]"
        set fail_count $OMF_MISSING_ARG
    else

        set key (grep -i "^$argv[2];" $argv[1])
        set columns (head -n1 $argv[1] |tr ";" "\n")

        if not [ -e $argv[1] ]
            echo (omf::err)"Database $argv[1] doesn't exist"(omf::off)
            set fail_count $OMF_MISSING_ARG
        else if [ (count $key) -gt 0 ]
            echo (omf::err)"Key $argv[2] already exists."(omf::off)
            set fail_count $OMF_MISSING_ARG
        else if [ (count $argv[2..-1]) -ne (count $columns) ]
            echo (omf::err)"The numbers of columns are not equal"(omf::off)
            echo "Usage: settings add [<database> <key> <values>]"
            echo "Specified columns: " $columns[2..-1]
            set fail_count $OMF_MISSING_ARG
        else
            settings.add $argv
        end
    end

    return $fail_count
end
