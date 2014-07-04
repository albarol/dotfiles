#check for an interactive session
[ -z "$PS1" ] && return

source $HOME/.shells/defaults
source $HOME/.shells/exports
source $HOME/.shells/alias
source $HOME/.shells/prompt
source $HOME/.shells/functions

