function init -a path --on-event init_fssh
    set -g FSSH_DB ~/.config/.fssh.db
    if not [ -e $FSSH_DB ]
        echo "key;type;user;pwd;host;tunnel" > $FSSH_DB
    end
    autoload $path/functions/{cli,backends}
end

