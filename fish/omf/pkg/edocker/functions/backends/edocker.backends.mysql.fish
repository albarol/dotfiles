
function edocker.backends.mysql
    printf (omf::dim)"Creating mysql container named $argv[1]"(omf::off)

    echo -n \n'Username (default: root): '
    head -n 1 - |read -l username

    echo -n 'Password (default: root): '
    head -n 1 - |read -l password

    echo -n 'Tag (default: 5.6): '
    head -n 1 - |read -l tag

    if [ -z $username ]
        set username root
    end

    if [ -z $password ]
        set password root
    end

    if [ -z $tag ]
        set tag "5.6"
    end

    docker run -p 3306:3306 --name $argv[1] -e MYSQL_ROOT_USERNAME=$username -e MYSQL_ROOT_PASSWORD=$password -d mysql/mysql-server:$tag 1> /dev/null
    echo \n"$argv[1] was created."
end
