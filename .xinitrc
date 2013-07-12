#!/bin/sh

nohup xbindkeys >>~/log/xbindkeys.log &
nohup qmpdclient >>~/log/qmpdclient &
nohup goldendict >>~/log/goldendict &

exec nohup startkde >>~/log/startkde.log

