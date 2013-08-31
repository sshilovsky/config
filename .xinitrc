#!/bin/sh

nohup xset dpms 0 0 0 >>~/log/xset.log &

nohup xbindkeys >>~/log/xbindkeys.log &
nohup qmpdclient >>~/log/qmpdclient &
nohup goldendict >>~/log/goldendict &

termite >/dev/null &

exec nohup i3 >>~/log/i3.log
exec nohup startkde >>~/log/startkde.log

