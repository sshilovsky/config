bindkey -v

autoload -U promptinit
promptinit
prompt bigfade
RPROMPT='[%?]'
autoload -z edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

alias irssi='tmux-session irssi irssi'
alias rtorrent='tmux-session rtorrent rtorrent'
alias cave='sudo cave -c yes'
alias sudoedit="env EDITOR=$EDITOR sudoedit"

alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias :e='vim'
alias :q='exit'
alias ,q='exit'
alias :quit='exit'
alias /quit='exit'
alias sl='sl -e'

function the_function()
{
    which eix >/dev/null 2>/dev/null
    local EIX=$?
    which aptitude >/dev/null 2>/dev/null
    local APTITUDE=$?
    which apt-cache >/dev/null 2>/dev/null
    local APTCACHE=$?

    if [ $EIX -ne 0 -a $APTITUDE -eq 0 ]
    then
        echo aptitude search
    elif [ $EIX -ne 0 -a $APTCACHE -eq 0 ]
    then
        echo apt-cache search
    else
        echo eix
    fi
}
alias eix="$(the_function)"
unfunction the_function

HISTSIZE=2000
HISTFILE="$HOME/.history"
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups hist_ignore_space

setopt extendedglob

# emulate vim option: backspace=...
bindkey "^W" backward-kill-word
bindkey "^H" backward-delete-char
bindkey "^U" backward-kill-line
bindkey "^?" backward-delete-char

if [ -d ~/.zshrc.d ]
then
    for i in ~/.zshrc.d/*
    do
        . $i
    done
    unset i
fi

alias dquilt="quilt --quiltrc=${HOME}/.quiltrc-dpkg"

# # Lines configured by zsh-newuser-install
# HISTFILE=~/.histfile
# HISTSIZE=1000
# SAVEHIST=1000
# setopt appendhistory autocd
# unsetopt beep
# bindkey -v
# # End of lines configured by zsh-newuser-install

# http://zetblog.ru/administration/201006/zsh-simple-customization/
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" ||
#         eval "$(dircolors -b /usr/bin/dircolors)"
#     alias ls='ls --color=auto'
#     alias dir='dir --color=auto'
#     alias vdir='vdir --color=auto'
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi
# 
# RPS1="(%*) %(?.:).:()"
# PS1="[$(print '%{\e[1;32m%}%n%{\e[0m%}@%{\e[1;36m%}%M%{\e[0m%}') %~]$ "
# /0

if [ "$TTY"=/dev/tty7 -a -z "$DISPLAY" ]
then
    loginctl activate "$XDG_SESSION_ID"
    exec startx
fi
