#!/bin/sh
. ~/.profile

setxkbmap -layout us,ru -option -option caps:escape,grp:toggle

nohup xset dpms 0 0 0 >>~/log/xset.log &

nohup xbindkeys >>~/log/xbindkeys.log &
nohup qmpdclient >>~/log/qmpdclient &
nohup goldendict >>~/log/goldendict &
nohup skype >>~/log/skype &
nohup psi >>~/log/psi &

termite >/dev/null &

exec nohup i3 >>~/log/i3.log
exec nohup startkde >>~/log/startkde.log

