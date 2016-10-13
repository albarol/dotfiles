
function edocker.show

    echo (omf::dim)"Show containers"\n(omf::off)
    docker ps -a |awk '{print $1, $NF}' |column -t

end
