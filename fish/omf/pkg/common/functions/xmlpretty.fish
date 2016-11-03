
function xmlpretty

    if [ (count $argv) -ne 1 ]; or not [ -e $argv[1] ]
       echo (omf::err)"Usage: xmlpretty <file>"(omf::off)
       return $OMF_MISSING_ARG
    else
        cat $argv[1] | xmllint --format -
    end
end
