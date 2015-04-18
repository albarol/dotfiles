
function sbt --description "Run sbt (Scala Build Tool)"
    if test $argv[1]
        eval "bash /opt/sbt/bin/sbt $argv[1]"
    else
        eval "bash /opt/sbt/bin/sbt"
    end
end
