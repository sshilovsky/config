#!/bin/sh

nohup xbindkeys >>~/log/xbindkeys.log &
#nohup yakuake &
#nohup skype &

exec startkde >>~/log/startkde.log

