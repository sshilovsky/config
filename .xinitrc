#!/bin/sh

nohup xbindkeys >>~/log/xbindkeys.log &
[ "$HOST" == "macdeb" ] || nohup skype >>~/log/skype.log &
nohup qmpdclient >>~/log/qmpdclient &
nohup goldendict >>~/log/goldendict &
nohup akregator >>~/log/akregator &

exec nohup startkde >>~/log/startkde.log

