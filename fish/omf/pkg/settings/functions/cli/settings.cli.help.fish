
function settings.cli.help -a command

    switch "$command"
        case "create"
            echo "\
Create settings database.

"(omf::dim)"Usage:"(omf::off)"
 settings create "(omf::em)"<database> <columns...>"(omf::off)" Create database with columns schema.


"(omf::dim)"Examples:"(omf::off)"
 settings create mydb name address
 settings create mydb user password
"

        case "a" "add"
            echo "\
Insert data on the database

"(omf::dim)"Usage:"(omf::off)"
 settings add "(omf::em)"<database> <key> <values...>"(omf::off)" Insert a key with values

"(omf::dim)"Examples:"(omf::off)"
 settings add mydb user1 settings home
 settings a mydb user2 root pwd
"

        case "r" "remove"
            echo "\
Remove data from database

"(omf::dim)"Usage:"(omf::off)"
 settings remove "(omf::em)"<database> <key>"(omf::off)" Remove data related to key

"(omf::dim)"Examples:"(omf::off)"
 settings remove mydb user1
 settings r mydb user2
"

        case "g" "get"
            echo "\
Retrieve data from database

"(omf::dim)"Usage:"(omf::off)"
 settings get "(omf::em)"<database> <key>"(omf::off)" Get data from specific key

"(omf::dim)"Examples:"(omf::off)"
 settings get mydb user1
"

        case "show"
            echo "\
Shows data from database

"(omf::dim)"Usage:"(omf::off)"
 settings show "(omf::em)"<database>"(omf::off)" Show data
 settings show "(omf::em)"<database>"(omf::off)" [ --sorted | -s ] Show data ordered by key

"(omf::dim)"Examples:"(omf::off)"
 settings show mydb
 settings show mydb --sorted
"

        case "*"
            echo "\
\$ settings [command] [arguments]

"(omf::dim)"Usage:"(omf::off)"
 settings "(omf::em)"create"(omf::off)" [<database> <columns>]
 settings "(omf::em)"add"(omf::off)" [<database> <key> <columns>]
 settings "(omf::em)"remove"(omf::off)" [<database> <key>]
 settings "(omf::em)"get"(omf::off)" [<database> <key>]
 settings "(omf::em)"show"(omf::off)" [<database>]

 "(omf::dim)"Commands:"(omf::off)"
 "(omf::em)"create"(omf::off)"    Create settings database.
 "(omf::em)"a"(omf::off)"dd       Insert data on database.
 "(omf::em)"r"(omf::off)"emove    Remove data from database.
 "(omf::em)"g"(omf::off)"et       Retrieve data from database.
 "(omf::em)"show"(omf::off)"      Shows data from database.
 "(omf::em)"help"(omf::off)"      Shows help about a specific action.

"(omf::dim)"Options:"(omf::off)"
"(omf::em)"--h"(omf::off)"elp     Display this help.

"
    end

end
