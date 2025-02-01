#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


alias ls="ls --color=auto"

alias ll="ls -l"
alias la="ls -la"


export EDITOR="nvim"


# Prompt
RESET="\[\e[0m\]"
GREEN="\[\e[92m\]"
BLUE="\[\e[94m\]"
CYAN="\[\e[96m\]"

DIR="${GREEN}\W${RESET}"

PS1="${BLUE}[${RESET} ${DIR} ${BLUE}]\$${RESET} "


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
