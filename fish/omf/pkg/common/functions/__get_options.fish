function __get_options -d "Transform parameters in a list of arguments"
    echo $argv | sed 's|--*|\\'\n'|g' | sed 's/[ \t]*$//' | grep -v '^$'
end
