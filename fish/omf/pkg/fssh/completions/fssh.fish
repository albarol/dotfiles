
complete -c fssh -f -d "Fish Ssh"

set -l current_aliases (fssh.cli.show | awk 'NR>1{print $2}')
for subcommand in "connect" "r" "remove"
    complete -c fssh -f -n "__fish_seen_subcommand_from $subcommand" -a "$current_aliases" -d alias
end

complete -c fssh -f -n "__fish_seen_subcommand_from a add" -a "mysql" -d "Mysql connection"
complete -c fssh -f -n "__fish_seen_subcommand_from a add" -a "ssh" -d "Ssh connection"

complete -c fssh -f -a connect -n "__fish_use_subcommand" -d "Connect on the service"
complete -c fssh -f -a add -n "__fish_use_subcommand" -d "Add service alias"
complete -c fssh -f -a remove -n "__fish_use_subcommand" -d "Add remove alias"
complete -c fssh -f -a show -n "__fish_use_subcommand" -d "Show service aliases"
