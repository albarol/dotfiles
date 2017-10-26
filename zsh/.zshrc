# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
export TERM="xterm-256color"
ZSH_THEME="bira"

# Change the command execution time stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git compleat history-search-multi-word zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Path to custom scripts
source ~/.user.zshrc


# Jump command alias
jp() {
    goto() {
        local MARK=$(jump _get $1)

        if [[ -z "$MARK" ]]; then
            printf "There is no mark \e[1m$1\e[0m\n";
            return
        fi

        cd $MARK
    }

    if [[ $# -eq 0 ]]; then
        jump --help
        return
    fi

    local cmd=$1
    shift

    case $cmd in
        mark) jump mark $@;;
        unmark) jump unmark $@;;
        _get) jump _get $@;;
        marks) jump marks;;
        clear) jump clear;;
        --help) jump --help;;
        *) goto $cmd;;
    esac
}
