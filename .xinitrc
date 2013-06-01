#!/bin/sh

nohup xbindkeys >>~/log/xbindkeys.log &
nohup skype >>~/log/skype.log &

exec nohup startkde >>~/log/startkde.log

