function notify --description "Show desktop notification after the task ends up"

    function info_help
        echo "Usage: notify COMMAND"
        echo "Arguments:"
        echo \t"COMMAND"\t"Any command"
        functions -e info_help
    end

    if [ (count $argv) -eq 0 ]
        info_help
        return 1
    end

    eval $argv[1..-1]; and notify-send "Task Complete" "$argv[1..-1]" --icon=dialog-information -t 1000; or notify-send "Task Error" "$argv[1..-1]" --icon=dialog-error -t 1000

    return 0
end
