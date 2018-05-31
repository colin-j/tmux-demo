#!/bin/bash

OPT=""
for x in {0..3}; do
	o=$OPT
	p=$(( 35 + (RANDOM&31) ))
	o="$o -p $p"
	if ((RANDOM & 1)); then
		o="$o -h"
	fi
	if ((RANDOM & 1)); then
		o="$o -d"
	fi
	tmux split-window $o 
done
