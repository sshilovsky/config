#!/bin/sh

nohup xbindkeys >>~/log/xbindkeys.log &
nohup qmpdclient >>~/log/qmpdclient &
nohup goldendict >>~/log/goldendict &

exec nohup i3 >>~/log/i3.log
exec nohup startkde >>~/log/startkde.log

