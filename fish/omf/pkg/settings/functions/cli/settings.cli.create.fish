
function settings.cli.create
    set fail_count 0

    if [ (count $argv) -lt 2 ]
        echo (omf::err)"Invalid arguments"(omf::off)
        echo "Usage: settings create [<database> <columns>]"
        return $OMF_MISSING_ARG
    else if [ -e $argv[1] ]
        echo (omf::err)"Database already exists"(omf::off)
        return $SETTINGS_ERROR
    else
        settings.add $argv[1] "key" $argv[2..-1]
    end
end
