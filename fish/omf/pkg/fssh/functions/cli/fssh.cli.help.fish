
function fssh.cli.help -a command

    switch "$command"
        case "connect"
            echo "\
Connect in specific service.

"(omf::dim)"Usage:"(omf::off)"
 fssh connect "(omf::em)"<alias>"(omf::off)" Connect in specific service.


"(omf::dim)"Examples:"(omf::off)"
 fssh connect remotedb
"

        case "a" "add"
            echo "\
Add service alias.

"(omf::dim)"Usage:"(omf::off)"
 fssh add mysql "(omf::em)"<alias> <user> <pwd> <host> (tunnel)"(omf::off)" Add mysql service alias.
 fssh add ssh "(omf::em)"<alias> <user> <host> (tunnel)"(omf::off)" Add ssh service alias.

"(omf::dim)"Examples:"(omf::off)"
 fssh add mysql remotedb user pwd localhost
 fssh a ssh remotehost user localhost tunnelhost
"

        case "r" "remove"
            echo "\
Remove data from database

"(omf::dim)"Usage:"(omf::off)"
 fssh remove "(omf::em)"<alias>"(omf::off)" Remove alias

"(omf::dim)"Examples:"(omf::off)"
 fssh remove remotedb
 fssh r remotedb
"

        case "show"
            echo "\
Shows aliases.

"(omf::dim)"Usage:"(omf::off)"
 fssh show Show aliases.
 fssh show (mysql|ssh) Show aliases for specific backend.

"(omf::dim)"Examples:"(omf::off)"
 fssh show
 fssh show ssh
"

        case "*"
            echo "\
\$ fssh [command] [arguments]

"(omf::dim)"Usage:"(omf::off)"
 fssh "(omf::em)"connect"(omf::off)" [<alias>]
 fssh "(omf::em)"add"(omf::off)" (mysql|ssh) [<alias> <user> <pwd> <host> (tunnel)]
 fssh "(omf::em)"remove"(omf::off)" [<alias>]
 fssh "(omf::em)"show"(omf::off)" (mysql|ssh)

 "(omf::dim)"Commands:"(omf::off)"
 "(omf::em)"c"(omf::off)"onnect   Connect in specific service.
 "(omf::em)"a"(omf::off)"dd       Add service alias.
 "(omf::em)"r"(omf::off)"emove    Remove alias.
 "(omf::em)"show"(omf::off)"      Shows aliases.
 "(omf::em)"help"(omf::off)"      Shows help about a specific action.

"(omf::dim)"Options:"(omf::off)"
"(omf::em)"--h"(omf::off)"elp     Display this help.

"
    end

end
