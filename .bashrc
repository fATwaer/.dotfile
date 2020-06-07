#  bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=
##########################################################
# alias
##########################################################

alias ll='ls -athl'
alias l='ls'
alias sl='ls'
alias gs="git status"
alias gs="git status"
alias vimrc='vim ${HOME}/.vim/vimrc'
alias bashrc='vim ${HOME}/.bashrc'
alias rel='source ${HOME}/.bashrc ${HOME}/.bash_profile'
alias tu='tmux -u'
alias py='python3'
alias py2='python'
alias python='python3'

alias grep="grep --color=auto"
alias mv="mv -b --backup=numbered "
alias cp="cp -i"

###########################################################
# environment
###########################################################
PS1="\[\033[1;37;1m\]\[\033[0;32;1m\]\H : \[\033[1;33;1m\]\w\[\033[1;37;1m\]\[\033[1;37;1m\] >> \[\033[1;37;1m\]"
PS2=">> "
HOST_NAME=$(hostname)
PROMPT_COMMAND=
echo -ne "\033]0;$(hostname)\a"
export GOPATH=~/go
export PATH=${PATH}:${GOPATH}/bin
###########################################################
# work/business
###########################################################

## ->truncate<- ##
