[[ $- != *i* ]] && return

export PATH="$HOME/bin:$PATH"

export EDITOR=nano

PS1="\[\e[0;32m\]\u@\h \[\e[0;34m\]\w$ \[\e[0m\]"