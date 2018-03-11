#!/bin/sh

## this binds a single nvim per desktop. Any terminal on that desktop will send files to it.
## vim is run in a tmux session which will be re-attached if the terminal is closed.

VIM_SERVER=nvim_`wmctrl -d | sed -nre "/\*/ s/^([0-9]+).*/\1/p"`
SOCKET_PREFIX=/tmp/nvimsockets
nvr_cmd="nvr -s --servername $SOCKET_PREFIX/$VIM_SERVER $@"
# avoid grabbing st from local node_modules... *sigh* do something cleaner about this.
PATH=/usr/bin:/bin

echo $SOCKET_PREFIX/$VIM_SERVER
mkdir -p $SOCKET_PREFIX
if nvr --serverlist | egrep -q "^$SOCKET_PREFIX/$VIM_SERVER\$"; then
	# send file open to existing session:
	echo $nvr_cmd
	$nvr_cmd

	# find vim window and raise:
	vim_window=`wmctrl -l | grep $VIM_SERVER | cut -d' ' -f1`
	if [ -z $vim_window ]; then
		# window closed, open a new one and attach to session:
		(st -t $VIM_SERVER -e tmux attach-session -t auto_$VIM_SERVER)&
	else
		# raise:
		wmctrl -i -R $vim_window
	fi
else
	# new session:
	echo st -t $VIM_SERVER -e tmux new-session -s auto_$VIM_SERVER "$nvr_cmd" \; set status off \;
	(st -t $VIM_SERVER -e tmux new-session -s auto_$VIM_SERVER "$nvr_cmd" \; set status off \;)&
fi
