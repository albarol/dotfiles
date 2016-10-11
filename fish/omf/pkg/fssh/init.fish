function init -a path --on-event init_fssh
    set -g FSSH_DB ~/.config/.fssh.db
    autoload $path/functions/{cli,backends}
end

