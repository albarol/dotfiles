function init -a path --on-event init_go
    set -gx PATH /usr/local/go/bin $PATH
    set -gx GOPATH $HOME/.go
end

