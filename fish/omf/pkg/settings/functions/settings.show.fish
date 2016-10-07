
function settings.show

    if [ (count $argv) -eq 2 ]; and contains -- $argv[2] '--sorted' '-s'
        cat $argv[1] |awk 'NR<2{print $0;next}{print $0| "sort"}'|\
        sed -e 's/;;/; ;/g' | column -s";" -t| less -#5 -N -S
    else
        cat $argv[1] |sed -e 's/;;/; ;/g' | column -s";" -t| less -#5 -N -S
    end
    return 0
end
