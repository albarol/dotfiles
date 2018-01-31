# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
# TERM=xterm-256color
ZSH_THEME="bira"

# Change the command execution time stamp shown in the history command output.
HIST_STAMPS="yyyy-mm-dd"

# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(
    z
    desk
    speedread
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Plugins configuration
export PATH=$PATH:$HOME/.zsh/bin
export FZF_DEFAULT_OPTS="--color=16 -0"
export FZF_CTRL_T_OPTS="--preview 'head -200 {}' --bind '?:toggle-preview'"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Path to custom scripts
[ -f $HOME/.zshrc.user ] && source $HOME/.zshrc.user
[ -f $HOME/.zshrc.aliases ] && source $HOME/.zshrc.aliases

# Enable zsh-custom completion
if [[ -d $HOME/.zsh-completions ]]; then
  fpath=($HOME/.zsh-completions $fpath)
  autoload -U compinit
  compinit
fi

# Load FZF Plugins
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true
