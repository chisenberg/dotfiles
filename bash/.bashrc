#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export GOPATH=$HOME/go

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error 0 -cwd-max-depth 1 -modules cwd,perms,git,ssh $?)"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

unzipd() {
    if [[ $# != 1 ]]; then echo I need a single argument;
        return 1;
    fi
    target="${1%.zip}"
    unzip "$1" -d "${target##*/}"
}
export -f unzipd

alias ls='ls --color=auto'
alias ll='ls -lah'
alias top='gotop'
alias subdl='subdl --interactive --lang=pob'
alias fixes='sudo /chdata/code/scripts/fixes.sh'
alias config='vim ~/.config/i3/config && clear'
alias bashrc='vim ~/.bashrc && source'
alias projects='cd /chdata/code/projects && clear && ls'
alias source='source ~/.bashrc && clear'
alias down='cd /chdata/down/ZOVER && clear && ls'
alias vim="vim -c 'startinsert'"
#alias cat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo default || echo GitHub)"

export PAGER="most"
PS1='[\u@\h \W]\$ '
