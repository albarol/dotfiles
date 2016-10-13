
function fssh.cli.add
    set fail_count 0

    if [ (count $argv) -lt 2 ]
        echo (omf::err)"Invalid arguments"(omf::off)
        echo "Usage: fssh add <type> <params>"
        return $OMF_MISSING_ARG
    end

    if [ $argv[1] = 'mysql' ]
        fssh.cli.add.mysql $argv[2..-1]
    else if [ $argv[1] = 'ssh' ]
        fssh.cli.add.ssh $argv[2..-1]
    else
        echo (omf::err)"Backend $argv[1] is not supported"(omf::off)
        echo "Use mysql or ssh instead."
        set fail_count $OMF_MISSING_ARG
    end

    return $fail_count
end
