#!/bin/bash

SLEEP_TIME=${SLEEP_TIME:-10s}
font='~/figlet-fonts/roman.flf'

win='DEMO'

colors=(red yellow green blue magenta)
line1=(H E L L O)
line2=(W O R L D)
cmd() {
	let x=$1
	echo "echo;echo;echo"
	echo "figlet -f $font \" ${line1[x]}\""
	echo "figlet -f $font -- ===="
	echo "figlet -f $font \"  ${line2[x]}\""
	echo "sleep $SLEEP_TIME"
}

tmux new-window -n "$win" "$(cmd 0)"
tmux setw -t ":$win" window-style "fg=white,bg=${colors[0]}"
for x in {1..4}; do
	tmux split-window -h -t ":$win" "$(cmd $x)"
	tmux select-pane -t ":$win.$x" -P "fg=white,bg=${colors[x]}"
	tmux select-layout -E -t ":$win"
done

