
function edocker.cli.clean

    if [ (count $argv) -ne 1 ]; and [ (count $argv) -ne 2 ]
        echo (omf::err)"Usage: edocker clean (minute | hour | day | week | month | year)"(omf::off)
        set fail_count $OMF_MISSING_ARG
    else if not contains -- $argv[1] "minute" "hour" "day" "week" "month" "year"
        echo (omf::err)"Usage: edocker clean (minute | hour | day | week | month | year)"(omf::off)
        set fail_count $OMF_INVALID_ARG
    else if [ (count $argv) -gt 1 ]; and [ $argv[2] != "--force" ]
        echo (omf::err)"Usage: edocker clean (minute | hour | day | week | month | year) [--force]"(omf::off)
        set fail_count $OMF_INVALID_ARG
    else
        edocker.clean $argv
    end

end
