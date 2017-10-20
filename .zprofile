source ~/.profile

if [ "$TTY" = /dev/tty7 -a -z "$DISPLAY" ]
then
    loginctl activate "$XDG_SESSION_ID"
    exec startx
fi
