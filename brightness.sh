#!/bin/bash
# -d Decreases brightness
# -i Increases brightness

dec="-d"
inc="-i"
path="/sys/class/backlight/intel_backlight/"
step=50

if [ $# -gt 1 -o $# -eq 0 ]; then
	exit
fi

if [ $dec = $1 ]; then
	curr=`cat ${path}actual_brightness`
	if [ $curr -gt $step ]; then
		echo "$[$curr-$step]" >> ${path}brightness
	fi
elif [ $inc = $1 ]; then
	curr=`cat ${path}actual_brightness`
	max=`cat ${path}max_brightness`
	if [ $[$max - $curr] -gt $step ]; then
		echo "$[$curr+$step]" >> ${path}brightness
	fi
else 
	exit
fi
