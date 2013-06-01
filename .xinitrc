#!/bin/sh

nohup xbindkeys >>~/log/xbindkeys.log &
nohup skype >>~/log/skype.log &
nohup qmpdclient >>~/log/qmpdclient &

exec nohup startkde >>~/log/startkde.log

