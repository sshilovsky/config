#!/bin/bash

MESSAGES=""

if ! fc-list | grep 'Liberation Mono'
then
	MESSAGES="${MESSAGES}Liberation Mono font is missing (xterm/Xresources)\n"
fi

if [ -n "${MESSAGES}" ]
then
	echo -e "${MESSAGES}" | xmessage -file -
fi
