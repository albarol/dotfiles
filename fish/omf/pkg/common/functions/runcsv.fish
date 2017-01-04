
function runcsv -d "Run commands on csv file"

    if [ (count $argv) -ne 2 ]
       echo "\
Usage: runcsv "(omf::em)"<csvfile> <command>"(omf::off)
        return $OMF_MISSING_ARG
    end

    set filename $argv[1]
    set command $argv[2]

    if not [ -e $filename ]
        echo (omf::err)"File $argv[1] not found."(omf::off)
        return $OMF_INVALID_ARG
    else
        cat $filename |sed 1d | tr ',' ' ' | xargs -l bash -c $command
    end
end
