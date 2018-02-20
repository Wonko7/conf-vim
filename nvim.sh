#!/bin/sh

## this binds a single vim per desktop. Any terminal on that desktop will send files to it.
## vim is run in a tmux session which will be re-attached if the terminal is closed.

VIM_SERVER=nvim_`wmctrl -d | sed -nre "/\*/ s/^([0-9]+).*/\1/p"`
nvr="/home/wjc/local/bin/nvr -s --servername $VIM_SERVER $@"

if nvr --serverlist | egrep -q "^$VIM_SERVER\$"; then
	# send file open to existing session:
	$nvr

	# find vim window and raise:
	vim_window=`wmctrl -l | grep $VIM_SERVER | cut -d' ' -f1`
	if [ -z $vim_window ]; then
		# window closed, attach to session:
		(st -t $VIM_SERVER -e tmux attach-session -t auto_$VIM_SERVER )&
	else
		# raise
		wmctrl -i -R $vim_window
	fi
else
	# new session:
	(st -t $VIM_SERVER -e tmux new-session -s auto_$VIM_SERVER "$nvr" \; set status off \; )&
fi
