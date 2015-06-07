#!/bin/bash

THRESHOLD=100
FILES=(*.jpg)
ONE="one.jpg"
TWO="two.jpg"

~/rpi-cam/take_picture_fast.sh $ONE
next=$TWO
while true
do
        ~/rpi-cam/take_picture_fast.sh $next
	if [ "$next" == "$TWO" ]; then
		next=$ONE
	else
		next=$TWO
	fi
	FILES=(*.jpg)
	if [ "${#FILES[@]}" -gt "1" ]; then
        	MOTION=$(motiontrack -s 9 ${FILES[0]} ${FILES[1]}  2>/dev/null |head -n1)
        	if [ "$MOTION" -gt "$THRESHOLD" ]; then
               		echo `date` "Motion! value: $MOTION";
		else
			echo `date` "No motion."
        	fi
	fi
done

