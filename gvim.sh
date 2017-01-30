#!/bin/sh

VIM_SERVER=`wmctrl -d | sed -nre "/\*/ s/^([0-9]+).*/\1/p"`


if [ ! -z "$*" ]; then
	(gvim -f --servername $VIM_SERVER --remote "$@"&)
else
	if ps aux | egrep -q "[g]vim.*servername.*\\<$VIM_SERVER\\>"; then
		echo vim server $VIM_SERVER is already running
		exit
	fi
	(gvim -f --servername $VIM_SERVER&)
fi
