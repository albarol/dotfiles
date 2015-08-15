function cptree --description 'Copy all directories and files from path'
    cp -rpdv $argv[1] $argv[2]
end
