
complete -c edocker -f -d "Extended docker"

complete -c edocker -f -n "__fish_seen_subcommand_from stop" -a "running" -d "Stop running containers."
complete -c edocker -f -n "__fish_seen_subcommand_from stop" -a "all" -d "Stop all containers."

for time in "minute" "hour" "day" "week" "month" "year"
    complete -c edocker -f -n "__fish_seen_subcommand_from clean" -a "$time" -d "$time"
end

complete -c edocker -f -a inspect -n "__fish_use_subcommand" -d "Return low-level information on a container"
complete -c edocker -f -a remove -n "__fish_use_subcommand" -d "Remove one or more containers"
complete -c edocker -f -a logs -n "__fish_use_subcommand" -d "Fetch the logs of a container"
complete -c edocker -f -a stop -n "__fish_use_subcommand" -d "Stop one or more containers"
complete -c edocker -f -a clean -n "__fish_use_subcommand" -d "Clean containers not used"
complete -c edocker -f -a show -n "__fish_use_subcommand" -d "Show containers"
