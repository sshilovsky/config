PATH="${HOME}/bin:${PATH}"

bindkey -v

autoload -U promptinit
promptinit
prompt bigfade

alias irssi='tmuxed irssi'
alias rtorrent='tmuxed rtorrent'

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

HISTSIZE=2000
HISTFILE="$HOME/.history"
SAVEHIST=$HISTSIZE
setopt hist_ignore_all_dups hist_ignore_space

setopt extendedglob

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
