# ADD THIS FILE TO END OF .bashrc
#
#
# Prompt
# export PS1=" \[\e[34m\]\T\[\e[m\] \[\e[35m\]\w\[\e[m\] \[\e[32m\]\\$\[\e[m\] "
export PS1="\[\e[m\] \[\e[35m\]\w\[\e[m\] \[\e[32m\]\\$\[\e[m\] "


# Notes alias!
alias todo="vim /home/shrub/rcode/todo.md"

# Colored man pages/less
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

# Ranger alias
alias r="ranger"

# Zathura alias
alias z="zathura --fork"

# bc alias
alias bc='bc -ql'

# Vim is the true editor
EDITOR="/usr/bin/vim"

# RTV VIM for editor
RTV_EDITOR="/usr/bin/vim"

# Neofetch alias
alias owofetch="neofetch --ascii ~/dotfiles/misc/ascii"
