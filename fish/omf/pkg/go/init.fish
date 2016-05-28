function init -a path --on-event init_go
    set -gx PATH /usr/local/go/bin $PATH
    set -gx GOROOT $HOME/.go
end

