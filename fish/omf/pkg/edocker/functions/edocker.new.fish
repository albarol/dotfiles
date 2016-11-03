
function edocker.new

    switch "$argv[1]"

      case "mysql"
        edocker.backends.mysql $argv[2]

    end

end
