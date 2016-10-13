function edocker.cli.help -a command

    switch "$command"
        case "i" "inspect"
            echo "\

Return low-level information on a container

"(omf::dim)"Usage:"(omf::off)"
 edocker inspect "(omf::em)"<container> [--format]"(omf::off)"

"(omf::dim)"Examples:"(omf::off)"
 edocker inspect mycontainer
 edocker inspect mycontainer --format \"{{ .NetworkSettings.IpAddress }}\"
"

        case "stop"
            echo "\

Stop one or more containers.

"(omf::dim)"Usage:"(omf::off)"
 edocker stop "(omf::em)"running"(omf::off)" Stop running containers.
 edocker stop "(omf::em)"all"(omf::off)"     Stop all containers.

"(omf::dim)"Examples:"(omf::off)"
 edocker stop running
 edocker stop all
"

        case "r" "remove"
            echo "\

Remove one or more containers

"(omf::dim)"Usage:"(omf::off)"
 edocker remove "(omf::em)"<container> [--force]"(omf::off)"

"(omf::dim)"Examples:"(omf::off)"
 edocker remove mycontainer
 edocker remove mycontainer --force
"

        case "clean"
            echo "\

Clean containers not used

"(omf::dim)"Usage:"(omf::off)"
 edocker clean "(omf::em)"(week | month | year) [--force]"(omf::off)"

"(omf::dim)"Examples:"(omf::off)"
 edocker clean week
 edocker clean month --force
"

        case "*"
            echo "\
\$ edocker [command] [arguments]

"(omf::dim)"Usage:"(omf::off)"
 edocker "(omf::em)"inspect"(omf::off)" <container> [--format]
 edocker "(omf::em)"remove"(omf::off)"  <container> [--force]
 edocker "(omf::em)"stop"(omf::off)"    (running | all)
 edocker "(omf::em)"clean"(omf::off)"   (week | month | year) [--force]

 "(omf::dim)"Commands:"(omf::off)"
 "(omf::em)"i"(omf::off)"nspect   Return low-level information on a container.
 "(omf::em)"r"(omf::off)"emove    Remove one or more containers.
 "(omf::em)"stop"(omf::off)"      Stop one or more containers.
 "(omf::em)"clean"(omf::off)"     Clean containers not used.
 "(omf::em)"help"(omf::off)"      Shows help about a specific action.

"(omf::dim)"Options:"(omf::off)"
"(omf::em)"--h"(omf::off)"elp     Display this help.

"
    end

end
